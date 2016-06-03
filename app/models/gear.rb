class Gear < ActiveRecord::Base
  belongs_to :user
  has_many :photos

  validates :gear_type, presence: true
  validates :price, presence: true
  validates :listing_name, presence: true, length: {maximum: 50}
  validates :location, presence: true
  validates :description, presence: true, length: {maximum: 500}

  

  end
