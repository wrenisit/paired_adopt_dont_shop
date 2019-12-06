class FavoritesController < ApplicationController

  def create
    pet = Pet.find(params[:pet_id])
    session[:favorites] ||= Hash.new
    session[:favorites][pet.id] = {
      name: pet.name,
      image: pet.image
    }
    Favorite.new(session[:favorites])
    redirect_to "/pets/#{params[:pet_id]}"
    flash[:notice] = "Favorite added!"
  end

  def index
    if @pets
      @favorites = @pets
    end
  end

  def destroy
    if params[:id]
      Favorite.destroy(params[:id])
      redirect_to '/favorites'
    else
      Favorite.destroy_all
      redirect_to '/favorites'
    end
  end
end
