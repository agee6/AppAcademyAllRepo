# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
<<<<<<< HEAD
user_arr = []
5.times do
  user_arr << User.create(email: Faker::Internet.email, password: "password" )
end
sub_arr = []
10.times do
  sub_arr << Sub.create(
    title: Faker::Company.name,
    description: Faker::Company.catch_phrase,
    moderator_id: user_arr.sample.id
  )
end
50.times do
  Post.create(
    title: Faker::Hipster.sentence,
    content: Faker::Hipster.paragraph,
    sub_id: sub_arr.sample.id,
    author_id: user_arr.sample.id
  )
end 
=======
>>>>>>> df507360b6b87b8b4b69fe0523f2dca32d06e03e
