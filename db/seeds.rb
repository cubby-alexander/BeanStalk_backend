# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do 
  Roaster.create(
    name: Faker::Company.name,
    email: Faker::Internet.email,
    img_url: Faker::Company.logo,
    password_digest: "123",
    address: Faker::Address.full_address,
    phone: Faker::PhoneNumber.phone_number,
    website: "https://beanstalk-app.herokuapp.com/register/roaster",
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4)
  )
end

50.times do
  Roast.create(
    name: Faker::Coffee.blend_name,
    picture: Faker::Company.logo,
    notes: Faker::Coffee.notes,
    origin: Faker::Coffee.origin,
    description: Faker::Company.bs, 
    roaster_id: Faker::Number.between(from: 1, to: 10),
    beanType: nil,
    published: Faker::Boolean.boolean,
    productionDate: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :long) #=> "October 15, 2018 10:48 AM
  )
end

20.times do
  User.create(
    name: Faker::Name::name,
    email: Faker::Internet::email,
    password_digest: "123",
  )
end

50.times do
  Comment.create(
    title: Faker::Lorem.word,
    author: Faker::Name.name,
    body: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
    user_id: 1,
    roast_id: Faker::Number.between(from: 1, to: 20)
  )
end