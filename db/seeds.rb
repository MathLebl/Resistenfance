# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p "Cleaning DataBase"
User.destroy_all
p '------------------'
p 'Starting seeds ...'
user1 = User.create!({pseudo: 'Fox Trot', grade: 'Sergent', email: 'foxtrot@test.com', password: 'testing123'})

user2 = User.create!({pseudo: 'Chuck Norris', grade: 'Lieutenant', email: 'chucknorris@test.com', password: 'testing123'})
'------------------'

audios_attributes = [
  {
    user: user1,
    audio_file: 'user1audio.mp3'
  },
  {
    user: user2,
    audio_file: 'user2audio.mp3'
  },
]

audios_attributes.each do |audios_attribute|
  audio_file = audios_attribute.delete(:audio_file)
  audio = AudioMessage.create!(audios_attribute)
  audio.audio_file.attach(io: File.open("audios/#{audio_file}"), filename: 'toto.mp3')
end

p '---------------'

p 'Finished !'

