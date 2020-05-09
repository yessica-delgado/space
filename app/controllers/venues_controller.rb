class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :show]
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  def index
    @venues = Venue.geocoded # returns flats with coordinates

    @markers = @venues.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude
      }
    end
  end

  #def search
  #@venues = Venue.includes(params[:name])
  #end

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
    @booking = Booking.new
    @reviews = Review.where(venue_id: params[:id])

  end

  def edit
  end

  def update
    @venue.update(venue_params)
    redirect_to venue_path(@venue)
  end

  def destroy
    @venue.destroy
    redirect_to venues_path
  end

  private

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:name, :address, :description, :photo, :capacity)
  end
end
