class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @audio_messages = AudioMessage.where(user_id: params[:id])
  end
end
