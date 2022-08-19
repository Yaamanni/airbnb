class AddPhotosToListings < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :image_url, :string
  end
end
