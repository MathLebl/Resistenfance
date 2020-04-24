class RemoveDescriptionFromAudioMessages < ActiveRecord::Migration[6.0]
  def change

    remove_column :audio_messages, :description, :string
  end
end
