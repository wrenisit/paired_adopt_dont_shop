class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :favorite_pets

  def favorite_pets
    @favs ||= Favorite.new(session[:favorites])
  end
end
