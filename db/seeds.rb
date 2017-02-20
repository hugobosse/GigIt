# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.firs

Bar.destroy_all
User.destroy_all
genre = ["jazz", "rock", "pop", "blues", "hip hop", "metal", "country", "classique"]
price = (0..200).to_a


50.times do
  Bar.create(
  name: Faker::Company.name
  genre: genre.sample
  address: Faker::Address.city
  price: price.sample
  description: Faker::Lorem.paragraph
  )
end

50.times do
  User.create(
  name: Faker::GameOfThrones.character
  email: Faker:Internet.email
  description: Faker::Lorem.paragraph
  )
end
