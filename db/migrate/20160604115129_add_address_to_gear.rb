class AddAddressToGear < ActiveRecord::Migration
  def change
    add_column :gears, :address, :string
  end
end
