class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :audio_message

  validates :message, presence: true
end
