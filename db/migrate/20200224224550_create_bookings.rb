class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :start
      t.datetime :end
      t.integer :duration
      t.integer :cost
      t.boolean :approved
      t.boolean :completed
      t.references :user, foreign_key: true
      t.references :planet, foreign_key: true

      t.timestamps
    end
  end
end
