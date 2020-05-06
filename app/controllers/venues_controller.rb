class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :show]

  def index
    @venues = Venue.geocoded # returns flats with coordinates

    @markers = @venues.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude
      }
    end
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    if @venue.save
      redirect_to venue_path(@venue)
    else
      render 'new'
    end
  end

  def show

    @venue = Venue.find(params[:id])
  end
  private

  def venue_params
    params.require(:venue).permit(:name, :address, :description, :photo, :capacity)
  end
end
