class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.string :origin
      t.string :destination
      t.string :airline
      t.datetime :depature_time
      t.integer :flight_number

      t.timestamps
    end
  end
end
