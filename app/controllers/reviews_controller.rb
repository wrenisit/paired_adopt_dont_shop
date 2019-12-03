class ReviewsController < ApplicationController
  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    review = shelter.reviews.create(review_params)
    review.save
      redirect_to('/shelters/#{shelter.id}')
  end

  def destroy
    Review.destroy(params[:review_id])
    redirect_to "/shelters/#{params[:id]}"
  end

  private

    def review_params
      params.permit(:title, :rating, :content)
    end
end
