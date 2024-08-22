# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Deleting any existing Bookings..."
Booking.destroy_all
puts "Deleting any existing Services..."
Service.destroy_all
puts "Deleting any existing Users..."
User.destroy_all

frida = User.create!(
  first_name: "Frida",
  last_name: "Schuh",
  username: "FridaDaCook",
  password:"123456",
  email: "hireme@bookthecooks.com"
)

lounis = User.create!(
  first_name: "Lounis",
  last_name: "Boudjemia",
  username: "TheLounis",
  password:"lounis",
  email: "lounisforhire@bookthecooks.com"
)

florian = User.create!(
  first_name: "Florian",
  last_name: "Sitte",
  username: "StarTyper",
  password:"123456",
  email: "email@gmail.com"
)

puts "Created Users"

# service from Frida
schnitzel = Service.create!(
  name: "Schnitzel Night",
  category: "German",
  user: frida,
  rating: 5,
  description: "Enjoy a night of Schnitzel with your friends!"
  )

currywurst = Service.create!(
  name: "Currywurst",
  category: "German",
  user: frida,
  rating: 4,
  description: "Enjoy a wonderful Currywurst original!"
  )

# service from Lounis
cordon = Service.create!(
  name: "Cordon Bleu",
  category: "French",
  user: lounis,
  rating: 4,
  description: "The best Cordon Bleu in town!"
  )

frog = Service.create!(
  name: "Frog Legs",
  category: "French",
  user: lounis,
  rating: 5,
  description: "You have never tasted anything like this!"
  )

# service from Florian
sushi = Service.create!(
  name: "Japanese Sushi",
  category: "Japanese",
  user: florian,
  rating: 3,
  description: "Real japanese Sushi! Expect an explosion of flavors!"
)

pizza = Service.create!(
  name: "Italian Pizza",
  category: "Italian",
  user: florian,
  rating: 2,
  description: "Nothing beats a good Pizza! 🍕"
)

burger = Service.create!(
  name: "Foodtruck Burgers",
  category: "American",
  user: florian,
  rating: 4,
  description: "This Foodtruck serves the best Burgers that you have ever tasted!"
)

puts "Created Services"

# Booking from Frida
Booking.create!(
  name: "Pizza Night",
  service_id: pizza.id,
  user_id: frida.id,
  date: Date.today,
  address: "Karl-Marx-Str. 1, 12043 Berlin"
  )

Booking.create!(
  name: "Birthday",
  service_id: burger.id,
  user_id: frida.id,
  date: Date.yesterday,
  address: "Potsdamer Str. 75, 10785 Berlin"
  )

# Booking from Lounis
Booking.create!(
  name: "Party",
  service_id: burger.id,
  user_id: lounis.id,
  date: Date.today,
  address: "Friedrichstraße 185-190, 10117 Berlin"
  )

Booking.create!(
  name: "Party",
  service_id: pizza.id,
  user_id: lounis.id,
  date: Date.yesterday,
  address: "Revaler Str. 99, 10245 Berlin"
  )

# Booking from Florian
Booking.create!(
  name: "Gun Convention",
  service_id: schnitzel.id,
  user_id: florian.id,
  date: Date.yesterday,
  address: "Leonhardtstraße 6, 14057 Berlin

Booking.create!(
  name: "Robot Party",
  service_id: frog.id,
  user_id: florian.id,
  date: Date.yesterday,
  address: "Danneckerstraße 7, 10245 Berlin"
)

Booking.create!(
  name: "Romantic Dinner",
  service_id: cordon.id,
  user_id: florian.id,
  date: Date.yesterday - 20,
  address: "Carl-Herz-Ufer 5, 10961 Berlin"
)

Booking.create!(
  name: "Lovely Lunch",
  service_id: currywurst.id,
  user_id: florian.id,
  date: Date.yesterday - 40,
  address: "Hindenburgdamm 30, 12203 Berlin"
)

puts "Created Bookings"
puts "Seeding done! 🌱"
