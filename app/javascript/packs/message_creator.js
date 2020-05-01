const eventListener = () => {
  document.addEventListener('click', (e) => {
    // console.log(e.target.parentNode.dataset.audioMessageId);
    if (e.target.className === "form") {
      const form = e.target.parentNode
      // console.log(form)
      form.addEventListener('submit', (e) => {
        e.preventDefault();
        // console.log(e.target.dataset.audioMessageId);
        messageGetter(form, e.target.dataset.audioMessageId);
      })
    }
  })
}

const messageGetter = (parentForm, audioMessageId) => {
  const form = parentForm.childNodes[1];
  const message = form.value
  postMessage(message, audioMessageId);
  form.value = "";
}

const postMessage = (message, audioMessageId) => {
  fetch('/comments', {
    method: 'POST',
    headers: {
      'Content-Type': "application/json"
    },
    body: JSON.stringify({ audio_message_id: audioMessageId, message: message })
  })
  .then(response => response.json())
  .then((data) => {
      // console.log(data.comment);
  })
}

eventListener();
