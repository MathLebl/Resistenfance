
const eventListener = () => {
  const form = document.querySelector('#search-form')
  // console.log(form)
  form.addEventListener('submit', (e) => {
    e.preventDefault();
    messageGetter();
  })
}

const messageGetter = () => {
  const form = document.querySelector('#form')
  const message = form.value
  postMessage(message);
  form.value = "";
}

const postMessage = (message) => {
  fetch('/comments', {
    method: 'POST',
    headers: {
      'Content-Type': "application/json"
    },
    body: JSON.stringify({ audio_message_id: 1, message: message })
  })
  .then(response => response.json())
  .then((data) => {
    // console.log(data.comment);
  })
}

export { eventListener };
