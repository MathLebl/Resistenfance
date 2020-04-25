class AudioMessagesController < ApplicationController
  before_action :set_message, only: %i[show]
  skip_before_action :authenticate_user!, only: %i[index]
  skip_before_action :verify_authenticity_token, only: %i[create]

  def index
    @audio_messages = AudioMessage.all
    if current_user
      @comments = Comment.all #loads all the audio messages comments
    else
      crypt_if_not_signed #launch method in private to make the code more readable
    end
  end

  def show
  end

  def new
    @audio_message = AudioMessage.new
  end

  def create
    @audio_message= AudioMessage.new(audio_message_params)
    @audio_message.user = current_user
    @audio_message.save!
    redirect_to audio_messages_path
  end

  def destroy
  end

  private

  def set_message
    @audio_message = AudioMessage.find(params[:id])
  end

  def audio_message_params
    params.require(:audio_message).permit(:audio_file)
  end

  def crypt_if_not_signed
    @comments = []
    @uncrypted_comments = Comment.all #loads all the audio messages comments
    @uncrypted_comments.each do |comment|
      crypter = MessageCrypter.new(comment.message)
      crypted_comment = Comment.new(user_id: comment.user_id, message: crypter.encrypt, audio_message_id: comment.audio_message_id)
      @comments << crypted_comment
    end
  end
end
