class AudioMessage < ApplicationRecord
  belongs_to :user
  has_many_attached :audio_file
end
