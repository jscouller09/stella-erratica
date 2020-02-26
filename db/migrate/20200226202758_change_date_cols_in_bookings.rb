class ChangeDateColsInBookings < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :start, :date
    change_column :bookings, :end, :date
  end
end
