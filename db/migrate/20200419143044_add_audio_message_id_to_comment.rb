class AddAudioMessageIdToComment < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :audio_message, null: false, foreign_key: true
  end
end
