class AddListingNameColumnToGear < ActiveRecord::Migration
  def change
    add_column :gears, :listing_name, :string
  end
end
