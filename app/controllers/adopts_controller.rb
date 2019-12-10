class AdoptsController < ApplicationController

  def new
    #@favorites = Pet.find(sessions[:favorites].split(','))
  end

  def create
    @application_params = adopt_params
    @adopt_pets = pets_params
    @adopt_pets.each do |id|
      @favs.pets.delete_if{|key, value| key == id }
    end
    redirect_to '/favorites'
    flash[:notice] = "Application Submitted"

  end


  private

    def adopt_params
      params.permit(:name, :address, :city, :state, :phone, :description)
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
