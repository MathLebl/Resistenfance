class AudioMessagesController < ApplicationController
  before_action :set_message, only: %i[show]
  skip_before_action :verify_authenticity_token, only: %i[create]

  def index
    @audio_messages = AudioMessage.all
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
end
