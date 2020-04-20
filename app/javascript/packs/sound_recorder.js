const recordAudio = () =>
        new Promise(async resolve => {
          const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
          const mediaRecorder = new MediaRecorder(stream);
          let audioChunks = [];

          mediaRecorder.addEventListener('dataavailable', event => {
            audioChunks.push(event.data);
          });

          const start = () => {
            audioChunks = [];
            mediaRecorder.start();
          };

          const stop = () =>
            new Promise(resolve => {
              mediaRecorder.addEventListener('stop', () => {
                const audioBlob = new Blob(audioChunks);
                const audioUrl = URL.createObjectURL(audioBlob);
                const audio = new Audio(audioUrl);
                const play = () => audio.play();
                resolve({ audioChunks, audioBlob, audioUrl, play });
              });

              mediaRecorder.stop();
            });

          resolve({ start, stop });
        });

      const sleep = time => new Promise(resolve => setTimeout(resolve, time));

      const recordButton = document.querySelector('#record');
      const stopButton = document.querySelector('#stop');
      const playButton = document.querySelector('#play');
      const saveButton = document.querySelector('#save');
      const savedAudioMessagesContainer = document.querySelector('#saved-audio-messages');

      let recorder;
      let audio;

      recordButton.addEventListener('click', async () => {
        recordButton.setAttribute('disabled', true);
        stopButton.removeAttribute('disabled');
        playButton.setAttribute('disabled', true);
        saveButton.setAttribute('disabled', true);
        if (!recorder) {
          recorder = await recordAudio();
        }
        recorder.start();
      });

      stopButton.addEventListener('click', async () => {
        recordButton.removeAttribute('disabled');
        stopButton.setAttribute('disabled', true);
        playButton.removeAttribute('disabled');
        saveButton.removeAttribute('disabled');
        audio = await recorder.stop();
      });

      playButton.addEventListener('click', () => {
        audio.play();
      });

      saveButton.addEventListener('click', () => {
        var record = new FormData();
        record.append('audio_message[audio_file]', audio.audioBlob, 'test');
          console.log('reloaded')
          fetch('/audio_messages', {
            method: 'POST',
            body: record
          }).then(res => {
            if (res.status === 201) {
              return populateAudioMessages();
            }
            console.log('Invalid status saving audio message: ' + res.status);
          });
        window.location.href = '/audio_messages';
      });


      const populateAudioMessages = () => {
        return fetch('/audio_messages').then(res => {
          if (res.status === 200) {
            return res.json().then(json => {
              json.messageFilenames.forEach(filename => {
                let audioElement = document.querySelector(`[data-audio-filename="${audio_messages.id}"]`);
                if (!audioElement) {
                  audioElement = document.createElement('audio');
                  audioElement.src = `/audio_messages/${audio_message.id}`;
                  audioElement.setAttribute('data-audio-filename', filename);
                  audioElement.setAttribute('controls', true);
                  savedAudioMessagesContainer.appendChild(audioElement);
                }
              });
            });
          }
          console.log('Invalid status getting messages: ' + res.status);
        });
      };

      populateAudioMessages();

export { recordAudio };
