class PetAdoptsController < ApplicationController

  def update
    @adopt_pet = PetAdopt.find_by(pet_id params[:pet_id], adopt_id: params[:adopt_id])
    #add column to pet_adopts table ((:approved))
    @adopt_pet.pet.toggle(:toggle_adoption_status)
    toggle.save
  end
end
