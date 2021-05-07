class FlightsController < ApplicationController

  def show
    flight = Flight.find_by(id: params[:id])
    render json: flight
  end

  def index
    flights = Flight.all
    render json: flights
  end
    
end
