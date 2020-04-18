class AudioMessage < ApplicationRecord
  belongs_to :user
  has_one_attached :audio_file
  accepts_nested_attributes_for :user
end
