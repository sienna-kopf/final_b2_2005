class WelcomeController < ApplicationController
  def index
    @passengers = Passenger.all
    @flights = Flight.all
  end
end
