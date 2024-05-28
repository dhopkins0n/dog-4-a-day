class RenameFirstDateAndEndDateInBookings < ActiveRecord::Migration[7.1]
  def change
    rename_column :bookings, :start_date, :start_time
    rename_column :bookings, :end_date, :end_time
  end
end
