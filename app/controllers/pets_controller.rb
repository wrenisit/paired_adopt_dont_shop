class PetsController < ApplicationController

  def index
    if params[:shelter_id]
      @shelter = Shelter.find(params[:shelter_id])
      @pets = @shelter.pets
    else
      @pets = Pet.all
    end
  end

  def show
     @pet = Pet.find(params[:id])
    # @favorite = Favorite.find_by(pet_id: params[:id])
    # @favorite = @pets[:favorites][:id]
  end

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    shelter.pets.create(pet_params)

    redirect_to "/shelters/#{shelter.id}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)

    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    @favs.pets.delete(params[:id])
    Pet.destroy(params[:id])
    redirect_to "/pets"
  end

  private
    def pet_params
      params.permit(:name, :description, :approximate_age, :sex, :image)
    end
end
