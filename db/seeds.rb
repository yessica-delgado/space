# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
puts "Cleaning database..."
Venue.destroy_all
User.destroy_all
puts 'database is clean'

addresses = ["208 Columbus St, Hicksville, OH, 43526", "200 Robbins Ln, Jericho, NY, 11753", "47 Revolutionary Rd, Ossining, NY, 10562",
 "36 W 138th St, New York, NY, 10037", "2289 5th Ave, New York, NY, 10037", "425 5th Ave, New York, NY, 10016", "17 Stuyvesant Walk, New York, NY, 10009",
 "446 W 46th St, New York, NY, 10036", "360 W 34th St, New York, NY, 10001", "561 Montgomery St, Jersey City, NJ, 07302", "95 Osprey Ct, Secaucus, NJ, 07094",
 "1061 Main St, Irwin, PA, 15642", "2527 N 17th St, Philadelphia, PA, 19132", "3826 Starship Ln NW, Wilson, NC, 27896", "1011 N Orient St, Fairmont, MN, 56031"
]
puts 'Creating venues'
50.times do |number|
  user = User.create!(email:"#{number}@gmail.com", password:"123456789")
  venue = Venue.create!(
    name: Faker::Restaurant.name,
    description: Faker::Restaurant.description,
    address: addresses.sample ,
    capacity: rand(1..500),
    user:user)
    5.times do |review|
      review = Review.create!(
        venue: venue,
        content: Faker::Quote.famous_last_words,
        rating: rand(1..5) )
    end


  #hacer attach al venue que ya se creo con codigo seed del lecture
  puts "venue #{venue.id} is created"
end


puts "Finished!"
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


