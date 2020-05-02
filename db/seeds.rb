# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
puts "Cleaning database..."
Venue.destroy_all
puts 'database is clean'

puts 'Creating venues'
50.times do |number|
  user = User.create(email:"#{number}@gmail.com", password:"123456789")
  venue = Venue.create!(
    name: Faker::Nation.capital_city,
    address:Faker::Address.street_address,
    user:user
)
  puts "venue #{venue.id} is created"
end

puts "Finished!"
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
