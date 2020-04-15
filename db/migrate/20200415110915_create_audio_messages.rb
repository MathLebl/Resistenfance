class CreateAudioMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :audio_messages do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
