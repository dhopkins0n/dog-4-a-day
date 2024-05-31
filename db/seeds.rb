# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"


Dog.destroy_all
User.destroy_all

user_1 = User.create!(
  email: "Jordan@email.com",
  first_name: "Jordan",
  last_name: "den Dulk",
  phone_number: "123456",
  address: "138 Kingsland Rd, London E2 8DY",
  password: "123456"
)

file = URI.open("https://media.licdn.com/dms/image/D4E03AQFohqu7scaWTw/profile-displayphoto-shrink_200_200/0/1699433378820?e=2147483647&v=beta&t=qK1YKOYKLkkFGnN0rz55_g72CN3XKb3JQQ0gH9q3a3o")
user_1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user_1.save!

user_2 = User.new(
  email: "test@test.com",
  first_name: "Shaggy",
  last_name: "Doo",
  phone_number: "123456",
  address: " Westminster Bridge Rd, London SE1 7PB",
  password: "123456"

)

file = URI.open("https://i.ebayimg.com/images/g/MCoAAOSwhdhicr~Q/s-l1200.jpg")
user_2.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user_2.save!



user_3 = User.new(
  email: "ben@test.com",
  first_name: "Ben",
  last_name: "Baranger",
  phone_number: "123456",
  address: " Crystal Palace",
  password: "123456"

)

file = URI.open("https://media.licdn.com/dms/image/C5603AQG4gvZztc0ZZQ/profile-displayphoto-shrink_400_400/0/1539616951880?e=1722470400&v=beta&t=HFR3vpDeyXtHHTBsfmvNVb4-aV_2kLwkfJWddRbIABQ")
user_3.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user_3.save!

user_4 = User.new(
  email: "esme@test.com",
  first_name: "Esme",
  last_name: "Chong",
  phone_number: "123456",
  address: "Camden",
  password: "123456"

)

file = URI.open("https://pbs.twimg.com/media/EDj4TD7WsAgGrA9.jpg")
user_4.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user_4.save!

dog_1 = Dog.new(
  name: "Frankie",
  age: "5",
  breed: "Cava-poo",
  description: "lovely 🐶",
  summary: "Cockapoos are bred more for temperament than for appearance, and they tend to inherit the sweet, loving and friendly natures common with both parent breeds. They are highly intelligent, easy to train and also typically inherit the poodle's enthusiasm and tendency to be little jokers.

  These dogs tend to be extremely friendly and thrive on social interaction. They hate to be left alone and can develop separation anxiety if left solo for long periods. They get along well with other pets and children although, due to their high energy and enthusiasm, they tend to do better with older children and should be supervised around young children.",
  user: user_1
)

file = URI.open("https://dogtime.com/wp-content/uploads/sites/12/2023/07/GettyImages-1330546852.jpg?w=1024")
dog_1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
dog_1.save!

file = URI.open("https://i.pinimg.com/originals/c7/bf/dc/c7bfdc2688127a9016db513e10a52c06.jpg")
dog_1.images.attach(io: file, filename: "nes.png", content_type: "image/png")
dog_1.save!

dog_1.tag_list.add('Neutered ✂️','good with children 👶🏽','need company ✋🏽')
dog_1.save!

dog_2 = Dog.new(
  name: "Scooby",
  age: "50",
  breed: "great dane",
  description: "strange mutant talking dog",
  user: user_2
)

file = URI.open("https://static.wikia.nocookie.net/near-pure-good-hero/images/d/db/Scooby-Doo_transparent.png/revision/latest?cb=20230713015847")
dog_2.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
dog_2.save!

dog_3 = Dog.new(
  name: "Scrappy",
  age: "30",
  breed: "great dane",
  description: "small and aggressive",
  user: user_2
)

file = URI.open("https://cdn.hanna-barberawiki.com/thumb/b/b6/Scrappy-Doo.png/1200px-Scrappy-Doo.png")
dog_3.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
dog_3.save!


dog_4 = Dog.new(
  name: "Rusty",
  age: "3",
  breed: "labrador",
  description: "Lovely energetic dog that plays well with others but sheds a lot",
  summary: "Labrador Retrievers, often simply called Labs, are one of the most popular dog breeds worldwide, known for their friendly and outgoing nature. With their iconic floppy ears, expressive eyes, and wagging tails, Labs exude charm and warmth. Renowned for their intelligence and eagerness to please, Labs excel in various roles, from assistance and therapy work to search and rescue missions. Their gentle demeanor and patience also make them exceptional companions for children, earning them the reputation of being one of the best family dogs.",
  user: user_3
)

file = URI.open("https://labfoxred.com/wp-content/uploads/2022/08/Jason09.jpeg")
dog_4.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
dog_4.save!

file = URI.open("https://images.squarespace-cdn.com/content/v1/61cc8ba17cd0966138da88e6/1681741744001-RLN9CEPSW0MOBNZIG018/0CFE339E-AB82-43B8-91DB-7DE63EA487DF.jpeg")
dog_4.images.attach(io: file, filename: "nes.png", content_type: "image/png")

dog_4.tag_list.add('Neutered ✂️','good with children 👶🏽','need company ✋🏽','need exercise 🎾', 'house trained 💩')
dog_4.save!
