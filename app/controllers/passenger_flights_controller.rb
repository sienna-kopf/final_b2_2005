class PassengerFlightsController < ApplicationController
  def create
    passenger = Passenger.find(params[:passenger_id])
    flight = Flight.find_by(number: params[:number])
    passenger.add_flight(flight)
    redirect_to "/passengers/#{passenger.id}"
  end
end
