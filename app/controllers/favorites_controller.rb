class FavoritesController < ApplicationController

  def create
    favorite = Favorite.create(pet_id: params[:pet_id])
    redirect_to "/pets/#{params[:pet_id]}"
    flash[:notice] = "Favorite added!"
  end

  def index
    if Favorite.count > 0
      @favorites = Favorite.all
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
