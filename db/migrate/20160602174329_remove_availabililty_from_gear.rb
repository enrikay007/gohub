class RemoveAvailabililtyFromGear < ActiveRecord::Migration
  def change
    remove_column :gears, :availabililty, :date
  end
end
