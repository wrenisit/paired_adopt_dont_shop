class Pet < ApplicationRecord

  belongs_to :shelter
  has_many :pet_adopts
  has_many :adopts, through: :pet_adopts
  validates_presence_of :image, :name, :approximate_age, :sex, :shelter, :description
end
