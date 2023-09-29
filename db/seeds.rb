# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Postulation.destroy_all
Offer.destroy_all
User.destroy_all

admin = User.create!(
  email: "estebanelGrande@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  role: 1,
  about_me: Faker::Movies::BackToTheFuture.quote
)

i = 0
until User.count == 51
  User.create!(
    email: "test#{i}@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    role: 0,
    about_me: Faker::Movies::BackToTheFuture.quote
  )
  i += 1
end

until Offer.count == 60
  Offer.create!(
    title: Faker::Movies::BackToTheFuture.character,
    description: Faker::Movies::BackToTheFuture.quote,
    amount_offer: rand(100000..10000000)
  )
end

users = User.where(role: 0)
offers = Offer.all

until Postulation.count == 50
  user = users.sample
  offer = offers.sample
  if !Postulation.find_by(user: user, offer: offer)
    Postulation.create!(
      user: users.sample,
      offer: offers.sample,
      why_me: Faker::Movies::BackToTheFuture.quote
    )
  end
end
