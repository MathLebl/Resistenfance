class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @audio_message = AudioMessage.find_by(user_id: params[:id])
  end
end
