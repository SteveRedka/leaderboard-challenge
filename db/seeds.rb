# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
  show = Show.create!(
    title: Faker::Lorem.words(3).join(' ').titleize,
    description: Faker::Lorem.paragraph
  )

  # create some number of reviews between 5 and 25
  (1..rand(5..25)).each do
    show.reviews.create!(
      critic_name: Faker::Name.name,
      publication_name: "#{Faker::Lorem.words} " + %w[Times Journal Inquirer Daily].sample,
      score: rand(1..100),
      body: Faker::Lorem.paragraph
    )
  end
end
