require 'rails_helper'

RSpec.describe "welcome page" do
  before :each do
    delta= Airline.create!(name: "Delta")
    united = Airline.create!(name: "United")
    swiss = Airline.create!(name: "Swiss Airlines")

    flight_1 = delta.flights.create!(number: "1727", date: "08/06/20", time: "13:30", departure_city: "Denver", arrival_city: "Munich")
    flight_2 = delta.flights.create!(number: "1837", date: "08/09/20", time: "01:45", departure_city: "Munich", arrival_city: "Atlanta")

    flight_3 = united.flights.create!(number: "4787", date: "08/21/20", time: "15:00", departure_city: "Atlanta", arrival_city: "Santiago")
    flight_4 = united.flights.create!(number: "7257", date: "08/30/20", time: "08:30", departure_city: "Santiago", arrival_city: "Denver")
    flight_5 = united.flights.create!(number: "4721", date: "09/05/20", time: "11:30", departure_city: "Denver", arrival_city: "San Diego")

    flight_6 = swiss.flights.create!(number: "7667", date: "09/08/20", time: "15:00", departure_city: "San Diego", arrival_city: "Seoul")
    flight_7 = swiss.flights.create!(number: "4441", date: "09/15/20", time: "01:45", departure_city: "Seoul", arrival_city: "Zurich")
    flight_8 = swiss.flights.create!(number: "2221", date: "09/25/20", time: "18:30", departure_city: "Zurich", arrival_city: "Denver")

    passenger_1 = Passenger.create!(name: "Cece", age: 18)
    passenger_2 = Passenger.create!(name: "Josh", age: 28)

    PassengerFlight.create!(passenger: passenger_1, flight: flight_1)
    PassengerFlight.create!(passenger: passenger_1, flight: flight_2)
    PassengerFlight.create!(passenger: passenger_1, flight: flight_3)
    PassengerFlight.create!(passenger: passenger_1, flight: flight_4)

    PassengerFlight.create!(passenger: passenger_2, flight: flight_1)
    PassengerFlight.create!(passenger: passenger_2, flight: flight_2)
    PassengerFlight.create!(passenger: passenger_2, flight: flight_3)
    PassengerFlight.create!(passenger: passenger_2, flight: flight_4)
    PassengerFlight.create!(passenger: passenger_2, flight: flight_5)
    PassengerFlight.create!(passenger: passenger_2, flight: flight_6)
    PassengerFlight.create!(passenger: passenger_2, flight: flight_7)
    PassengerFlight.create!(passenger: passenger_2, flight: flight_8)
  end

  it "displays links to every passenger and flight show page in the system" do
    visit "/"

    within ".flights" do
      expect(page).to have_link("Flight 1727")
      expect(page).to have_link("Flight 1837")
      expect(page).to have_link("Flight 4787")
      expect(page).to have_link("Flight 7257")
      expect(page).to have_link("Flight 4721")
      expect(page).to have_link("Flight 7667")
      expect(page).to have_link("Flight 4441")
      expect(page).to have_link("Flight 2221")
    end

    within ".passengers" do
      expect(page).to have_link("Cece's Info")
      expect(page).to have_link("Josh's Info")
    end

    within ".passengers" do
      click_on "Josh's Info"
    end

    expect(current_path).to eq("/passengers/#{@passenger_2.id}")

    visit "/"

    within ".flights" do
      click_on "Flight 4721"
    end 

    expect(current_path).to eq("/flights/#{@flight_5.id}")
  end
end
