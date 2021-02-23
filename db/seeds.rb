# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

new_user = User.create(email: 'email@email.com', password: 'Password1')

# Yurt.create!(title:"Teepee", description: "A great TeePee", max_capacity: 10, location:"Suffolk", day_rate:"55")

new_yurt1 = Yurt.new(title:"Teepee", description: "A great TeePee", max_capacity: 10, location:"Suffolk", day_rate:"55", user_id: 1)
new_yurt1.save


new_yurt2 = Yurt.new(title:"Wedding Marque", description: "Brilliant for getting married", max_capacity: 100, location:"Kent", day_rate:"2800", user_id: new_user.id)
new_yurt2.save

new_yurt3 = Yurt.new(title:"Kurt's Yurt", description: "My old yurt", max_capacity: 4, location:"Devon", day_rate:"5", user_id: new_user.id)
new_yurt3.save

new_booking = Booking.create(booked_from: '28/07/2021', booked_to: '29/07/2021', total_cost: '250', user_id: new_user.id, yurt_id: 1)
