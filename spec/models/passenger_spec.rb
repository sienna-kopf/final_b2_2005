require 'rails_helper'

RSpec.describe Passenger do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe 'relationships' do
    it {should have_many :passenger_flights}
    it {should have_many(:flights).through(:passenger_flights)}
  end

  describe 'methods' do
    before :each do
      @delta= Airline.create!(name: "Delta")
      @flight_1 = @delta.flights.create!(number: "1727", date: "08/06/20", time: "13:30", departure_city: "Denver", arrival_city: "Munich")
      @flight_2 = @delta.flights.create!(number: "1837", date: "08/09/20", time: "01:45", departure_city: "Munich", arrival_city: "Atlanta")

      @passenger = Passenger.create!(name: "Cece", age: 18)
    end
    it '#add_flight' do
      expect(@passenger.flights).to eq([])

      @passenger.add_flight(@flight_1)
      expect(@passenger.flights).to eq([@flight_1])
      @passenger.add_flight(@flight_2)
      expect(@passenger.flights).to eq([@flight_1, @flight_2])
    end
  end
end
