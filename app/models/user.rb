class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :audio_messages, dependent: :destroy
  has_many :comments, dependent: :destroy

  enum avatar: [ :gohan, :goku, :vegeta, :krillin ]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :grade, inclusion: { in: %w(Caporale Sergent Adjudant Major Lieutenant Capitaine Colonel Général),
    message: "%{grade} n'est pas un grade autorisé !" }
end
