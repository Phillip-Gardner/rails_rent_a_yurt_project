# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
Booking.destroy_all
Yurt.destroy_all
User.destroy_all


new_user = User.create(email: 'email@email.com', password: 'Password1')
user2 = User.create(email: 'hello@hello.com', password: '123Password')
user3 = User.create(email: 'Kurt@gmail.com', password: 'Password!')
user4 = User.create(email: 'yurt_owner@email.com', password: 'iloveyurts')
user5 = User.create(email: 'email@yahoo.com', password: 'password1')
user6 = User.create(email: 'hello@hotmail.co.uk', password: 'Password!')
user7 = User.create(email: 'email@email.co.uk', password: 'tents1234')
user8 = User.create(email: 'bonjour@hello.com', password: 'frenchie10')
user9 = User.create(email: 'john@johns.fr', password: 'Password2')
user10 = User.create(email: 'hi@hotmail.co.uk', password: 'password123')


new_yurt1 = Yurt.new(title:"Teepee", description: "A great TeePee", max_capacity: 10, location:"Suffolk", day_rate:"55")
new_yurt1.user = new_user
new_yurt1.save


new_yurt2 = Yurt.new(title:"Wedding Marque", description: "Brilliant for getting married", max_capacity: 100, location:"Kent", day_rate:"2800")
new_yurt2.user = user7
new_yurt2.save

new_yurt3 = Yurt.new(title:"Kurt's Yurt", description: "My old yurt", max_capacity: 4, location:"Devon", day_rate:"5")
new_yurt3.user = user8
new_yurt3.save

new_yurt4 = Yurt.new(title: "Best Yurt",)
new_yurt4.user = user5

file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
article = Article.new(title: 'NES', body: "A great console")
article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

new_yurt4.save





new_booking = Booking.create(booked_from: '28/07/2021', booked_to: '29/07/2021', total_cost: '250', user: user3, yurt: new_yurt2)
new_booking = Booking.create(booked_from: '01/03/2021', booked_to: '10/03/2021', total_cost: '35', user: user10, yurt: new_yurt1)


# Yurt.create!(title:"Teepee", description: "A great TeePee", max_capacity: 10, location:"Suffolk", day_rate:"55")

puts "#{User.all.count} users created"
puts "#{Yurt.all.count} yurts created"
puts "#{Booking.all.count} booking created"
