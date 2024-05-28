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

user_1 = User.create(
  email: "Jordan@email.com",
  first_name: "Jordan",
  last_name: "den Dulk",
  phone_number: "123456",
  address: "le wagon"
)

dog_1 = Dog.new(
  name: "Frankie",
  age: "5",
  breed: "Cava-poo",
  description: "lovely 🐶",
  user: user_1
)

file = URI.open("https://dogtime.com/wp-content/uploads/sites/12/2023/07/GettyImages-1330546852.jpg?w=1024")
dog_1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
dog_1.save
