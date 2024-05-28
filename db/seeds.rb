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
  address: "le wagon",
  password: "123456"
)

user_2 = User.new(
  email: "test@test.com",
  first_name: "Shaggy",
  last_name: "Doo",
  phone_number: "123456",
  address: "Mystery Van",
  password: "123456"

)

file = URI.open("https://i.ebayimg.com/images/g/MCoAAOSwhdhicr~Q/s-l1200.jpg")
user_2.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user_2.save!

dog_1 = Dog.new(
  name: "Frankie",
  age: "5",
  breed: "Cava-poo",
  description: "lovely 🐶",
  user: user_1
)

file = URI.open("https://dogtime.com/wp-content/uploads/sites/12/2023/07/GettyImages-1330546852.jpg?w=1024")
dog_1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
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
