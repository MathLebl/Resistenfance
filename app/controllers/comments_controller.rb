class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create]

  def index
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.save!
    render json: { comment: @comment }
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:audio_message_id, :message)
  end
end
