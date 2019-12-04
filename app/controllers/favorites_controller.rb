class FavoritesController < ApplicationController

  def create
    pet = Pet.find(params[:pet_id])
    favorite = Favorite.create(pet: pet)
    redirect_to "/pets/#{pet.id}"
    flash[:notice] = "Favorite added!"
  end

  def index
    @favorites = Favorite.all
  end

  def destroy
    Favorite.destroy(params[:id])
    redirect_to '/favorites'
  end
end
