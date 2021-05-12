class AddArrivalDepartureAndAircraftToFlights < ActiveRecord::Migration[6.1]
  def change
    change_column :flights, :departure_time, :string
    add_column :flights, :arrival_time, :string
    add_column :flights, :aircraft, :string
  end
end
