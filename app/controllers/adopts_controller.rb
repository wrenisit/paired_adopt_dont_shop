class AdoptsController < ApplicationController

  def new
    #@favorites = Pet.find(sessions[:favorites].split(','))
  end

  def create
    @application_params = adopt_params
    @adopt_pets = pets_params
    adopt = Adopt.new(@application_params)
    if adopt.save
      @adopt_pets.each do |id|
        PetAdopt.new(pet_id: id, adopt_id: adopt.id)
        @favs.pets.delete_if{|key, value| key == id }
      end
      flash[:notice] = "Application Submitted"
      redirect_to '/favorites'
    else
      flash[:notice] = "Incomplete Application"
      render :new
    end
  end

  


  private

    def adopt_params
      params.permit(:name, :address, :city, :state, :phone, :zip, :description)
    end

    def pets_params
      pets_list = []
      params.each do |key, value|
        if key == value
          pets_list << key
        end
      end
      pets_list
    end
end
