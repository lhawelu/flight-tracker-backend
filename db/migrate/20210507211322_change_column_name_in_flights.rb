class ChangeColumnNameInFlights < ActiveRecord::Migration[6.1]
  def change
    rename_column :flights, :depature_time, :departure_time
  end
end
