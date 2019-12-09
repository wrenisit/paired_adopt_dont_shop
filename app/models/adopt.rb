class Adopt < ApplicationRecord

  has_many :pet_adopts
  has_many :pets, through: :pet_adopts
  validates_presence_of :name, :address, :city, :state, :zip, :phone, :description
end
