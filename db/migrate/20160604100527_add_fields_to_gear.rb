class AddFieldsToGear < ActiveRecord::Migration
  def change
    add_column :gears, :latitude, :float
    add_column :gears, :longitude, :float
  end
end
