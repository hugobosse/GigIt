# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.firs

Booking.destroy_all
Bar.destroy_all
User.destroy_all

price = [0, 50, 100, 150, 200]
genre = ["jazz", "rock", "pop", "blues", "hip hop", "metal", "country", "classique", "tout genre"]
capacity = [25, 50, 75, 100, 125]

bars = JSON.parse(open("db/bars.json","r").read)
bars = bars.first(15)
bars.each do |bar|
  Bar.create!(
  name: bar["name"],
  genre: genre.sample,
  address: bar["address"],
  price: price.sample,
  description: bar["description"],
  capacity: capacity.sample
  )
  Bar.last.photo_url = bar["photo_url"]
end

15.times do
  User.create!(
  username: Faker::GameOfThrones.character,
  email: Faker::Internet.email,
  description: Faker::Lorem.paragraph,
  password: "testtest"
  )
end

@user = User.all
@bar = Bar.all
rating = [1, 2, 3, 4, 5]
fakeid = rand(1..15)

15.times do
  Booking.create!(
  booking_date: Faker::Date.between(300.days.ago, Date.today),
  bar_rating: rating.sample,
  bar_review: Faker::Lorem.paragraph,
  user_rating: rating.sample,
  user_review: Faker::Lorem.paragraph,
  user_id: (@user.ids).sample,
  bar_id: (@bar.ids).sample
)
end
# bien de mettre le point d ex pour lever erreur si ca pete dans le seed
