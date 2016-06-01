class Gear < ActiveRecord::Base
  belongs_to :user

  validates :gear_type, presence: true
  validates :price, presence: true
  validates :availabililty, presence: true
  validates :location, presence: true
  validates :description, presence: true, length: {maximum: 500}

  

  end