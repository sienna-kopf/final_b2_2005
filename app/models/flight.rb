class Flight < ApplicationRecord
  validates_presence_of :number, :date, :time, :departure_city, :arrival_city
end
