require 'rails_helper'

RSpec.describe Flight do
  describe 'validations' do
    it {should validate_presence_of :number}
    it {should validate_presence_of :date}
    it {should validate_presence_of :time}
    it {should validate_presence_of :departure_city}
    it {should validate_presence_of :arrival_city}
  end

  describe 'relationships' do
    it {should belong_to :airline}

    it {should have_many :passenger_flights}
    it {should have_many(:passengers).through(:passenger_flights)}
  end

  describe 'methods' do
    before :each do
      @airline = Airline.create!(name: "Delta")
      @flight_1 = @airline.flights.create!(number: "1727", date: "08/06/20", time: "13:30", departure_city: "Denver", arrival_city: "Munich")
      @passenger_1 = @flight_1.passengers.create!(name: "Carlo", age: 55)
      @passenger_2 = @flight_1.passengers.create!(name: "Joanne", age: 50)
      @passenger_3 = @flight_1.passengers.create!(name: "Sarina", age: 20)
      @passenger_4 = @flight_1.passengers.create!(name: "John", age: 75)
      @passenger_5 = @flight_1.passengers.create!(name: "Zoey", age: 7)
      @passenger_5 = @flight_1.passengers.create!(name: "Lily", age: 17)
      @passenger_5 = @flight_1.passengers.create!(name: "Sienna", age: 18)
    end

    it "#count_minors" do
      expect(@flight_1.count_minors).to eq(2)
    end

    it "#count_adults" do
      expect(@flight_1.count_adults).to eq(5)
    end
  end
end
