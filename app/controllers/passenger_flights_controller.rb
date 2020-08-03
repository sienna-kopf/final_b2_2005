class PassengerFlightsController < ApplicationController
  def create
    passenger = Passenger.find(params[:passenger_id])
    if params[:number].empty? || Flight.find_by(number: params[:number]).nil?
      flash[:errors] = "Flight number must be valid!"
      redirect_to "/passengers/#{passenger.id}"
    else
      flight = Flight.find_by(number: params[:number])
      passenger.add_flight(flight)
      redirect_to "/passengers/#{passenger.id}"
    end
  end
end
