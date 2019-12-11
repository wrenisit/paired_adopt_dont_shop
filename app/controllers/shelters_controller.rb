class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def new
  end

  def create
    shelter = Shelter.create(shelter_params)
      if shelter.save
        redirect_to '/shelters'
      else
        flash[:notice] = "Cannot create shelter. Missing required information."
        render :new
      end
  end

  def show
    @shelter = Shelter.find(params[:id])
    @reviews = @shelter.reviews
    @count_of_adoptions = @shelter.find_adoptions
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update(shelter_params)
      shelter.save
      redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    Shelter.destroy(params[:id])
    redirect_to '/shelters'
  end

  private

    def shelter_params
      params.permit(:name, :address, :city, :state, :zip)
    end
end
