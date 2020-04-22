class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :audio_messages, dependent: :destroy
  has_many :comments, dependent: :destroy

  enum avatar: [ :gohan, :goku, :vegeta, :krillin ]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
