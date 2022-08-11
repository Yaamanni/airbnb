class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.integer :num_of_rooms
      t.integer :num_of_beds
      t.text :description
      t.date :start_date
      t.date :end_date
      t.decimal :price
      t.integer :num_of_guests

      t.timestamps
    end
  end
end
