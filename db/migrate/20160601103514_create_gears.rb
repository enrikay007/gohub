class CreateGears < ActiveRecord::Migration
  def change
    create_table :gears do |t|
      t.string :gear_type
      t.integer :price
      t.date :availabililty
      t.string :location
      t.text :description
      t.boolean :is_insurance
      t.boolean :active
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
