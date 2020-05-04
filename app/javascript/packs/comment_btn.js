// Add toggle effect to Comments Card

const buttons = document.querySelectorAll('button')
const commentsBlocks = document.querySelectorAll('.audio-card-comments')

buttons.forEach((button, index) => {
  const commentsBlock = commentsBlocks[index];
  button.addEventListener('click', () => {
    commentsBlock.classList.toggle('is-visible');
  });
});
