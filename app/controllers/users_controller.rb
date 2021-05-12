class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: @user.errors.full_messages }, status: :not_acceptable
    end
  end

  def my_bookings
    bookings = User.find_by(id: @@user.id).bookings.map{|booking| {
      id: booking.flight.id,
      origin: booking.flight.origin,
      destination: booking.flight.destination,
      airline: booking.flight.airline,
      flight_number: booking.flight.flight_number,
      seatNumber: booking.seat,
      arrival_time: booking.flight.arrival_time,
      departure_time: booking.flight.departure_time,
      aircraft: booking.flight.aircraft
    }}
    if bookings
      render json: bookings, :status => :ok
    else
      render json: { error: 'No flights booked' }, :status => :no_content
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :password_confirmation)
  end

end
