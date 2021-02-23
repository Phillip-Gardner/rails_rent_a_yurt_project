# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require "faker"
Booking.destroy_all
Yurt.destroy_all
User.destroy_all
puts 'creating 5 users and yurts'

new_user = User.create(email: 'email@email.com', password: 'Password1')
user2 = User.create(email: 'hello@hello.com', password: '123Password')
user3 = User.create(email: 'Kurt@gmail.com', password: 'Password!')
user4 = User.create(email: 'yurt_owner@email.com', password: 'iloveyurts')
user5 = User.create(email: 'email@yahoo.com', password: 'password1')

new_yurt1 = Yurt.new(title:"Teepee", description: "A great TeePee", max_capacity: 10, location:"Suffolk", day_rate:"55", user_id: 1)
new_yurt.user = new_user
new_yurt1.save

new_yurt2 = Yurt.new(title:"Wedding Marque", description: "Brilliant for getting married", max_capacity: 100, location:"Kent", day_rate:"2800")
new_yurt2.user = user4
new_yurt2.save

new_booking = Booking.create(booked_from: '28/07/2021', booked_to: '29/07/2021', total_cost: '250', user: user3, yurt: new_yurt2)
new_booking = Booking.create(booked_from: '01/03/2021', booked_to: '10/03/2021', total_cost: '35', user: user5, yurt: new_yurt1)

# puts "Destroy users"
# User.destroy_all if Rails.env.development?
title = ["Lovely Yurt", "Kurt's Yurt", "Best Yurt", "Stunning Teepee", "Gorgeous Tent"]
description = ["I can guarantee you won't find a nicer Yurt in the South", "My old yurt", "A Great teepee", "Brilliant for getting married", "stunning yurt in the countryside"]
location = ["Surrey", "Kent", "Yorkshire", "Highlands", "Devon", "Cornwall", "Wiltshire", "Suffolk"]
# user_filenames = ['nicolas-horn-MTZTGvDsHFY-unsplash_xpfqge.jpg', 'ben-parker-NohB3FJSY90-unsplash_bgq5zz.jpg', 'ben-parker-OhKElOkQ3RE-unsplash_cbbhi5.jpg', 'luis-villasmil-6qf1uljGpU4-unsplash_xvyzar.jpg', 'sarah-brown-tTdC88_6a_I-unsplash_wkvvpl.jpg']
yurt_photos =
['https://res.cloudinary.com/dlxlmoq7d/image/upload/v1614098398/4Yurt_qq7byn.jpg',
'https://res.cloudinary.com/dlxlmoq7d/image/upload/v1614098394/3Yurt_mvbwzq.jpg',
'https://res.cloudinary.com/dlxlmoq7d/image/upload/v1614098391/2Yurt_jrqjfy.jpg',
'https://res.cloudinary.com/dlxlmoq7d/image/upload/v1614098388/1Yurt_rblxqp.jpg',
'https://res.cloudinary.com/dlxlmoq7d/image/upload/v1614093588/z8amus5p9g4don1sqet116gstp10.jpg']
yurt_filenames = ['4Yurt_qq7byn.jpgg', '3Yurt_mvbwzq.jpgg',
 '2Yurt_jrqjfy.jpg', '1Yurt_rblxqp.jpg', 'z8amus5p9g4don1sqet116gstp10.jpg']

counter = 0
5.times do
  # user_file = URI.open("#{user_photos[counter]}")
  # add host=true once added to model
  user = User.create!(email: Faker::Internet.email, password: '123456')
  # user.photo.attach(io: user_file, filename: "#{user_filenames[counter]}", content_type: 'image/jpg')
  yurt_file = URI.open("#{yurt_photos[counter]}")
  yurt = Yurt.new(title: "#{title[counter]}", description: "#{description[counter]}", location:"#{location[counter]}", max_capacity: Faker::Number.within(range: 1..250), day_rate:Faker::Number.within(range: 20..100), user_id: user.id )
  yurt.photo.attach(io: yurt_file, filename: "#{yurt_filenames[counter]}", content_type: 'image/jpg')
  yurt.save
  counter += 1
end
