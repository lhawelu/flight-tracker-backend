class BookingsController < ApplicationController

  def new
    booking = Booking.new
  end

  def create
    booking = Booking.new
    booking.user = @@user
    booking.flight_id = booking_params[:id]
    booking.seat = booking_params[:seatNumber]
    if booking.save
      render json: booking
    else
      render  json: { error: booking.errors.full_messages }
    end
  end
  
  private

  def booking_params
    params.require(:flightData).permit(:seatNumber, :id)
  end

end
