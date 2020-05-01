import consumer from "./consumer"

const commentsContainer = document.getElementsByClassName('comments-list')

if (commentsContainer) {
  consumer.subscriptions.create({ channel: 'CommentChannel' }, {
    received(data) {
      console.log(data);
      const commentContainer = document.getElementById(`comments-list-${data.audioMessageId}`)
      commentContainer.insertAdjacentHTML('beforeend', data.message);
    }
  })
}
