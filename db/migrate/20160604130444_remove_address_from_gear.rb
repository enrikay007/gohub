class RemoveAddressFromGear < ActiveRecord::Migration
  def change
    remove_column :gears, :address, :string
  end
end
