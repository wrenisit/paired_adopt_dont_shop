class Adopt < ApplicationRecord
  has_many :pet_adopts
  has_many :pets, through: :pet_adopts
  validates_presence_of :name, :address, :city, :state, :zip, :phone, :description

  def apply_for_pets
    #Need: pets_ids, application_data
    #creates the application
    #for each pet checked, joins table it
    #remove applied pets from the favs
  end

  
end
