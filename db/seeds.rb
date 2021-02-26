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
puts 'creating 13 users, 8 yurts and 3 bookings'

new_user = User.create(email: 'email@email.com', password: 'Password1')
user2 = User.create(email: 'hello@hello.com', password: '123Password')
user3 = User.create(email: 'Kurt@gmail.com', password: 'Password!')
user4 = User.create(email: 'yurt_owner@email.com', password: 'iloveyurts')
user5 = User.create(email: 'email@yahoo.com', password: 'password1')

# puts "Destroy users"
# User.destroy_all if Rails.env.development?
title =
["Lovely Yurt in Surrey",
  "Best Yurt",
  "Kurt's Yurt",
  "Brent's Tent",
  "Stunning Teepee",
  "Beautiful Venue in the Countryside",
  "Romantic Yurt with a bath",
  "Luxury Yurt with Stunning Views",

  ]
description =
["We are delighted to offer our cosy yurt for holidays and events. Fully furnished and comfortable, it's particularly nice in the summer!",
  "I can guarantee you won't find a nicer Yurt in the South. Very popular for weddings, it can fit up to 200 guests",
  "A stunning old yurt, hidden away in the countryside. Perfect for families",
  "Cute yurt in our garden in Devon. Plenty of space, and lots of activities in the vicinity. We hope you enjoy your stay",
  "Gorgeous tent in the highlands. Jaw-dropping views of the Scottish coastline. You will love the peace and quiet",
  "Our fantastic yurt is great for intimate weddings. We can also provide food and entertainment, if required",
  "Our stunning teepee is perfect for a romantic getaway. A holiday to remember!",
  "Come and stay in our gorgeous yurt. Located on the edge of our farm, you will wake up to the sound of animals and the smell of the freshly-baked bread we deliver to your door"]
location = ["Surrey", "Kent", "Yorkshire, England", "Devon", "Highlands",  "Cornwall", "Wiltshire", "Suffolk"]
max_capacity = [30, 200, 50, 15, 8, 60, 200, 10 ]
day_rate = [300, 2000, 400, 320, 120, 80, 100, 1200]
# user_filenames = ['nicolas-horn-MTZTGvDsHFY-unsplash_xpfqge.jpg', 'ben-parker-NohB3FJSY90-unsplash_bgq5zz.jpg', 'ben-parker-OhKElOkQ3RE-unsplash_cbbhi5.jpg', 'luis-villasmil-6qf1uljGpU4-unsplash_xvyzar.jpg', 'sarah-brown-tTdC88_6a_I-unsplash_wkvvpl.jpg']
yurt_photos =
['https://res.cloudinary.com/dlxlmoq7d/image/upload/v1614098398/4Yurt_qq7byn.jpg',
'https://res.cloudinary.com/dlxlmoq7d/image/upload/v1614098394/3Yurt_mvbwzq.jpg',
'https://res.cloudinary.com/dlxlmoq7d/image/upload/v1614098391/2Yurt_jrqjfy.jpg',
'https://res.cloudinary.com/dlxlmoq7d/image/upload/v1614098388/1Yurt_rblxqp.jpg',
'https://res.cloudinary.com/dlxlmoq7d/image/upload/v1614093588/z8amus5p9g4don1sqet116gstp10.jpg',
'https://res.cloudinary.com/dlxlmoq7d/image/upload/v1614180839/joshua-alan-davis-NnIZx8dVrfI-unsplash_bxsyzs.jpg',
'https://res.cloudinary.com/dlxlmoq7d/image/upload/v1614180809/BathYurt_fvhofa.jpg',
'https://res.cloudinary.com/dlxlmoq7d/image/upload/v1614180862/annie-spratt-0mElfGrF8EM-unsplash_xlv5dm.jpg']
yurt_filenames =
['4Yurt_qq7byn.jpgg',
  '3Yurt_mvbwzq.jpgg',
 '2Yurt_jrqjfy.jpg',
 '1Yurt_rblxqp.jpg',
 'z8amus5p9g4don1sqet116gstp10.jpg',
 'joshua-alan-davis-NnIZx8dVrfI-unsplash_bxsyzs.jpg',
 'BathYurt_fvhofa.jpg',
 'annie-spratt-0mElfGrF8EM-unsplash_xlv5dm.jpg' ]

counter = 0
8.times do
  # user_file = URI.open("#{user_photos[counter]}")
  # add host=true once added to model
  user = User.create!(email: Faker::Internet.email, password: '123456')
  # user.photo.attach(io: user_file, filename: "#{user_filenames[counter]}", content_type: 'image/jpg')
  yurt_file = URI.open("#{yurt_photos[counter]}")
  yurt = Yurt.new(title: "#{title[counter]}", description: "#{description[counter]}", location:"#{location[counter]}", max_capacity: "#{max_capacity[counter]}", day_rate:"#{day_rate[counter]}", user_id: user.id )
  yurt.photo.attach(io: yurt_file, filename: "#{yurt_filenames[counter]}", content_type: 'image/jpg')
  yurt.save!
  counter += 1
end


new_booking = Booking.create(booked_from: '28/07/2021', booked_to: '29/07/2021', total_cost: '250', user: user3, yurt: Yurt.first)
new_booking = Booking.create(booked_from: '01/03/2021', booked_to: '10/03/2021', total_cost: '35', user: user5, yurt: Yurt.last)
new_booking = Booking.create(booked_from: '30/05/2021', booked_to: '05/06/2021', total_cost: "2000", user: user4, yurt: Yurt.first)
