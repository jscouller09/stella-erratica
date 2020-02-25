class SetDefaultsForBookingCompletedAndApproved < ActiveRecord::Migration[5.2]
  def change
    change_column_default :bookings, :approved, from: '', to: false
    change_column_default :bookings, :completed, from: '', to: false
  end
end
