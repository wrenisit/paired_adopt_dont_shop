class FavoritesController < ApplicationController

  def create
    pet = Pet.find(params[:pet_id])
    session[:favorites] ||= Hash.new
    session[:favorites][pet.id] = {
      name: pet.name,
      image: pet.image
    }
    redirect_to "/pets/#{params[:pet_id]}"
    flash[:notice] = "Favorite added!"
  end

  def index
    @list = @favs.find_pets
  end

  def destroy
    if params[:id]
      @favs.pets.delete(params[:id])
      redirect_to "/pets/#{params[:id]}"
    else
      session.delete(:favorites)
      redirect_to '/favorites'
    end
  end
end
