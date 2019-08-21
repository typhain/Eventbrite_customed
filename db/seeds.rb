# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
User.destroy_all
Event.destroy_all
Attendance.destroy_all

10.times do
  User.create(email: "#{Faker::Lorem.unique.word}@yopmail.com", description: Faker::Lorem.sentence, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: 123456, password_confirmation: 123456)
end

puts "Created 10 fake users."

10.times do
  Event.create(start_date: Faker::Date.forward(days: 120), duration: rand(60..1440), title: Faker::Music::RockBand.name, description: Faker::Lorem.paragraph(sentence_count: rand(4..12)), price: rand(1..100), location: Faker::Address.full_address, administrator: User.all.sample)
end

puts "Created 10 fake events."

10.times do
  Attendance.create(user: User.all.sample, event: Event.all.sample)
end

puts "Created 10 fake attendances."
