class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :flight, null: false, foreign_key: true
      t.string :seat

      t.timestamps
    end
  end
end
