class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create]

  def index
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      ActionCable.server.broadcast "audio_messages", message: render_comment(@comment), audioMessageId: @comment.audio_message_id
      # ActionCable.server.broadcast("audio_messages", render_to_string(partial: "comment", locals: { comment: @comment, user: current_user }))
      render json: { comment: @comment } #render JSON which will be sent in response to the fetch
    end
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:audio_message_id, :message)
  end

  def render_comment(comment)
    ApplicationController.renderer.render(partial: 'comments/comment', locals: { comment: comment, user: current_user })
  end
end
