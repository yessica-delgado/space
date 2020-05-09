class BookingsController < ApplicationController
  def new
    @venue = Venue.find(params[:venue_id])
    @user = current_user
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @venue = Venue.find(params[:venue_id])
    @user = current_user
    @booking.venue = @venue
    @booking.user = @user
    if @booking.save
      render 'shared/booking_confirmation'
    else
      render 'venues/show'
    end
  end
  def index
  end
  def show
  end


private
 def booking_params
   params.require(:booking).permit(:date)
 end

end
