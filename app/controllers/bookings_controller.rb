class BookingsController < ApplicationController

  def new
    booking = Booking.new
  end

  def create
    booking = Booking.new(booking_params)
    if booking.save
      render json: booking
    else
      render  json: { error: booking.errors.full_messages }
    end
  end
  
  private

  def booking_params
    params.require(:booking).permit(:user_id, :flight_id, :seat)
  end

end
