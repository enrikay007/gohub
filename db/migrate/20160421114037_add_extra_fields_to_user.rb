class AddExtraFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone_number, :string
    add_column :users, :date_of_birth, :datetime
    add_column :users, :gender, :boolean, default: false
    add_column :users, :live_in, :string
    add_column :users, :description, :text
    
  end
end
