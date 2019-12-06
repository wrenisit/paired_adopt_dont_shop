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
    if @pets
      @favorites = @pets
    end
  end

  def destroy
    if params[:id]
      pet = Pet.find(params[:id])
      session[:favorites].delete(pet.id.to_s)
      redirect_to '/favorites'
    else
      session[:favorites].clear
      redirect_to '/favorites'
    end
  end
end
