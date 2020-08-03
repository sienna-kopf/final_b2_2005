class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.string :number
      t.string :date
      t.string :time
      t.string :departure_city
      t.string :arrival_city

      t.timestamps
    end
  end
end
