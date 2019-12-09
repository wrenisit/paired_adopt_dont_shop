class AdoptsController < ApplicationController

  def new
    #@favorites = Pet.find(sessions[:favorites].split(','))
  end

  def create
    application = Adopt.new(adopt_params)
    @favorites = session[:favorites]
    redirect_to '/favorites'
  end


  private

    def adopt_params
      params.permit(:name, :address, :city, :state, :phone, :description)
    end
end
