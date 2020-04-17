class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    message = "Mon engin est le plus IMPOSANT !"
    @crypter = MessageCrypter.new(message)
    @encrypted = @crypter.encrypt
  end
end
