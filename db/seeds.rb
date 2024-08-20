# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Deleting any existing restaurants..."
User.destroy_all
Service.destroy_all

frida = User.create!(first_name: "Frida",
  last_name: "Schuh",
  username: "FridaDaCook",
  password:"123",
  email: "hireme@bookthecooks.com"
)

Service.create!(name: "Schnitzel in your face",
  category: "German",
  user: frida.id
)

lounis = User.create!(first_name: "Lounis",
  last_name: "Boudjemia",
  username: "TheLounis",
  password:"lounis",
  email: "lounisforhire@bookthecooks.com"
)

Service.create!(name: "Good food for you",
  category: "French",
  user: lounis.id
)

arnold = User.create!(first_name: "Arnold",
  last_name: "Schwarzenegger",
  username: "TheTerminator",
  password:"Illbeback",
  email: "getothechoppanow@predator.com"
)

Service.create!(name: "Stuff your fat face",
  category: "Fried Chicken",
  user: arnold.id
)
