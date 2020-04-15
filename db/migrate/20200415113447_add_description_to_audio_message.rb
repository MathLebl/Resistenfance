class AddDescriptionToAudioMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :audio_messages, :description, :string
  end
end
