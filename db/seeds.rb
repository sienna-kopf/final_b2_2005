# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Airline.destroy_all
Flight.destroy_all
Passenger.destroy_all
PassengerFlight.destroy_all

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
passenger_3 = Passenger.create!(name: "Claire", age: 8)

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

PassengerFlight.create!(passenger: passenger_3, flight: flight_1)
PassengerFlight.create!(passenger: passenger_3, flight: flight_4)
PassengerFlight.create!(passenger: passenger_3, flight: flight_5)
PassengerFlight.create!(passenger: passenger_3, flight: flight_6)
