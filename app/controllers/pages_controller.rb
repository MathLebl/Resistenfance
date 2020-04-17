class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @message = "Mon engin est le plus IMPOSANT !"
    crypter = MessageCrypter.new(@message)
    @encrypted = crypter.encrypt
    decrypter = MessageCrypter.new(@encrypted)
    @decrypted = decrypter.decrypt
  end
end
