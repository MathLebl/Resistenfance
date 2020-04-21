import consumer from "./consumer"

const commentsContainer = document.getElementById('comments-list')

if (commentsContainer) {
  consumer.subscriptions.create({ channel: 'CommentChannel' }, {
    received(data) {
      // console.log(data);
      commentsContainer.insertAdjacentHTML('beforeend', data);
    }
  })
}
