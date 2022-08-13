class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.integer :num_of_guests
      t.string :status

      t.timestamps
    end
  end
end
