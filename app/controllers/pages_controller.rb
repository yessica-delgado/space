class PagesController < ApplicationController
  skip_before_action :authenticate_user!

 def home
  random_venue = rand(Venue.count)
  @venues = Venue.offset(random_venue).limit(9)
 end
end
