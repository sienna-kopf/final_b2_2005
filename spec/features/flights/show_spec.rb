require 'rails_helper'

RSpec.describe "flight show page" do
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
  it "displays flight information, airline, and passenger list" do
    visit "/flights/#{@flight_1.id}"

    expect(page).to have_content("Flight Number: 1727")
    expect(page).to have_content("Departure Date: 08/06/20")
    expect(page).to have_content("Departure Time: 13:30")
    expect(page).to have_content("Departure City: Denver")
    expect(page).to have_content("Arrival City: Munich")

    expect(page).to have_content("Airline: Delta")

    within ".passengers" do
      expect(page).to have_content("Carlo")
      expect(page).to have_content("Joanne")
      expect(page).to have_content("Sarina")
      expect(page).to have_content("John")
      expect(page).to have_content("Zoey")
      expect(page).to have_content("Lily")
      expect(page).to have_content("Sienna")
    end
  end

  it "displays the number of minors and adults on the flight" do
    visit "/flights/#{@flight_1.id}"

    within '.passenger-statistics' do
      expect(page).to have_content("Minor Count: 2")
      expect(page).to have_content("Adult Count: 5")
    end
  end
end
