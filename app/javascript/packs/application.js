require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

// Add toggle effet to Comments
const btn = document.querySelector('buton')

const commentsBlock = document.querySelector('.audio-message-comments')

let isVisible = false

btn.addEventListener('click', () => {
  isVisible = !isVisible;
  isVisible ? commentsBlock.classList.add('is-visible') : commentsBlock.classList.remove('is-visible');
});
