class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
    @pets_pending = Hash.new(0)
    @shelters.each do |shelter|
      @pets_pending[shelter.id] = shelter.any_pending?
    end
  end

  def new
  end

  def create
    shelter = Shelter.new(shelter_params)
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
    @count = @shelter.any_pending?
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
