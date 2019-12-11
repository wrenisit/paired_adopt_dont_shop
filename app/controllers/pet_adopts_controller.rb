class PetAdoptsController < ApplicationController

  def update
    pet = Pet.find(params[:id])
    pet.toggle_adoption_status
    redirect_to "/pets/#{pet.id}"
    #add column to pet_adopts table ((:approved))
  end
end
