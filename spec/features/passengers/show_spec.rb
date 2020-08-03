require 'rails_helper'

RSpec.describe "passenger show page" do
  before :each do
    @delta= Airline.create!(name: "Delta")
    @united = Airline.create!(name: "United")
    @flight_1 = @delta.flights.create!(number: "1727", date: "08/06/20", time: "13:30", departure_city: "Denver", arrival_city: "Munich")
    @flight_2 = @delta.flights.create!(number: "1837", date: "08/09/20", time: "01:45", departure_city: "Munich", arrival_city: "Atlanta")
    @flight_3 = @united.flights.create!(number: "4787", date: "08/21/20", time: "15:00", departure_city: "Atlanta", arrival_city: "Santiago")
    @flight_4 = @united.flights.create!(number: "7257", date: "08/30/20", time: "08:30", departure_city: "Santiago", arrival_city: "Denver")
    @flight_5 = @united.flights.create!(number: "4721", date: "09/05/20", time: "11:30", departure_city: "Denver", arrival_city: "San Diego")

    @passenger = Passenger.create!(name: "Cece", age: 18)

    PassengerFlight.create!(passenger: @passenger, flight: @flight_1)
    PassengerFlight.create!(passenger: @passenger, flight: @flight_2)
    PassengerFlight.create!(passenger: @passenger, flight: @flight_3)
    PassengerFlight.create!(passenger: @passenger, flight: @flight_4)
  end

  it "displays passengers name and their flight numbers" do
    visit "/passengers/#{@passenger.id}"

    expect(page).to have_content("Cece")

    within '.flights' do
      expect(page).to have_content("Flight 1727")
      expect(page).to have_content("Flight 1837")
      expect(page).to have_content("Flight 4787")
      expect(page).to have_content("Flight 7257")

      expect(page).to have_link("1727")
      expect(page).to have_link("1837")
      expect(page).to have_link("4787")
      expect(page).to have_link("7257")

      click_on "4787"
    end

    expect(current_path).to eq("/flights/#{@flight_3.id}")
  end

  it "contains a form to add a new flight for that passenger" do
    visit "/passengers/#{@passenger.id}"

    within '.add_flight_form' do
      fill_in :number, with: "4721"
      click_on "Submit"
    end

    expect(current_path).to eq("/passengers/#{@passenger.id}")

    within '.flights' do
      expect(page).to have_content("Flight 4721")
      expect(page).to have_link("4721")
    end
  end

  it "throws error message if form is sumbmitted incomplete" do
    visit "/passengers/#{@passenger.id}"

    within '.add_flight_form' do
      fill_in :number, with: ""
      click_on "Submit"
    end

    expect(current_path).to eq("/passengers/#{@passenger.id}")
    expect(page).to have_content("Flight number can't be blank!")
  end
end
