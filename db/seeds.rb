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
photos = ["https://res.cloudinary.com/dthacgw4y/image/upload/v1589042870/Fitroy_wedding_venue_z0krmz.jpg", "https://res.cloudinary.com/dthacgw4y/image/upload/v1589042871/5eb6a6b6ed1897b173bce99c665be576_ztgoqo.png", "https://res.cloudinary.com/dthacgw4y/image/upload/v1589042872/Lakeway-Resort---Spa-Lakeway-TX-b5fe8342-e544-4870-97f5-93f12eb6a471_thumbnail.1574892829_nzo8ta.jpg", "https://res.cloudinary.com/dthacgw4y/image/upload/v1589042876/10-of-Our-Favorite-Luxury-Wedding-Venues-in-the-U.S.-00026_c9n31j.png", "https://res.cloudinary.com/dthacgw4y/image/upload/v1589042879/Historic-Acres-of-Hershey-Elizabethtown-PA-d58856f3-cb33-4f21-8339-772b4382e9d7_thumbnail.1571416019_rugzxz.jpg", "https://res.cloudinary.com/dthacgw4y/image/upload/v1589042891/Canyon-Springs-Golf-Club-San-Antonio-TX-6bf7107b-7f45-4fd9-be5f-c42f1171a332_thumbnail.1526419648_tiz3q7.jpg", "https://res.cloudinary.com/dthacgw4y/image/upload/v1589042898/The-Scottsdale-Plaza-Resort-Paradise-Valley-AZ-21d15517-f98e-4b72-9735-1da6942035c5_thumbnail.1565280306_lecsvg.jpg", "https://res.cloudinary.com/dthacgw4y/image/upload/v1589042907/TheUnfinishedChurch-JoseVilla-06_brw90y.jpg", "https://res.cloudinary.com/dthacgw4y/image/upload/v1589042915/Pazzo-s-311-Chicago-IL-db6094ab-8d72-479c-962e-ec8e5f424218_thumbnail.1564778530_pgwhqc.jpg", "https://res.cloudinary.com/dthacgw4y/image/upload/v1589042925/__opt__aboutcom__coeus__resources__content_migration__brides__public__brides-services__production__2016__10__24__580e50fbba4a5731dd536bb5_blogs-aisle-say-miami-beach-venues-palms-hotel-916226921aea4df0b36548de61320277_ermiba.jpg", "https://res.cloudinary.com/dthacgw4y/image/upload/v1589042936/The-Westin-St--Francis-San-Francisco-CA-907b6864-3997-4617-a3c2-3bbd68854390_thumbnail.1544058205_ow7bvu.jpg", "https://res.cloudinary.com/dthacgw4y/image/upload/v1589042948/palace-of-fine-arts_jjnixh.png", "https://res.cloudinary.com/dthacgw4y/image/upload/v1589042961/Marina-Frank-Ama-Photography-Lawless-Crystal-Ballroom-Sambuca-LG-Entertainment-HI-RES-036_hhn4if.jpg", "https://res.cloudinary.com/dthacgw4y/image/upload/v1589042975/top-10-most-favorite-wedding-venues-in-bali-1_qdyn9u.jpg", "https://res.cloudinary.com/dthacgw4y/image/upload/v1589043023/758a6488d207e68d2ac8934df257a679_vwvomr.jpg", "https://res.cloudinary.com/dthacgw4y/image/upload/v1589043081/__opt__aboutcom__coeus__resources__content_migration__brides__public__brides-services__production__2016__10__24__580e50fc382731317addba4d_blogs-aisle-say-miami-beach-wedding-venues-acqualina-ecae0e77d1724de4ba8acb299b05dea4_errstg.jpg", "https://res.cloudinary.com/dthacgw4y/image/upload/v1589043102/Villa-Antonia-Texas_ciyxfp.jpg", "https://res.cloudinary.com/dthacgw4y/image/upload/v1589043147/image_tcphz4.jpg"] #subir 10 fotos a cloudinary
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
    file = URI.open(photos.sample)
    venue.photo.attach(io: file, filename: '#{venue.name}.png', content_type: 'image/png')

  #hacer attach al venue que ya se creo con codigo seed del lecture
  puts "venue #{venue.id} is created"
end


puts "Finished!"
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


