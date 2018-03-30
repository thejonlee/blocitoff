# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

7.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "password"
  )
  user.items.create!(name: Faker::StarWars.character,
                  created_at: Faker::Date.backward(6))
end
users = User.all

10.times do
  Item.create!(
    name: Faker::StarWars.character,
    created_at: Faker::Date.backward(6)
  )
end
items = Item.all

puts "Seeds finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
