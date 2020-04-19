const form = document.querySelector('#form')

const eventListener = () => {
  form.addEventListener('submit', (e) => {
    e.preventDefault();
    messageGetter();
  })
}

const messageGetter = () => {
  const message = form.value
  postMessage(message);
}

const postMessage = (message) => {
  fetch('/audio_messages', {
    method: 'POST',
    headers: {
      'Content-Type': "application/json"
    },
    body: JSON.strigify({ user_id: 1, description: message })
  })
  .then(response => response.json())
  .then((data) => {
    console.log(data);
  }
}
