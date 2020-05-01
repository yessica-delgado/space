class UsersController < ApplicationController

  def new
    @venue = Venue.new # needed to instantiate the form_for
  end

   def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to venue_path(@venue)
    else
      render 'new'
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :description, :price, :picture_url)
  end
end
