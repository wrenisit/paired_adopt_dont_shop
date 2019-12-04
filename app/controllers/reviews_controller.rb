class ReviewsController < ApplicationController
  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    @shelter = Shelter.find(params[:shelter_id])
    review = @shelter.reviews.create(review_params)
    if review.save
      redirect_to "/shelters/#{@shelter.id}"
      flash[:notice] = "Review created successfully!"
    else
      flash[:notice] = "Review was not created. Required information missing"
      render :new
    end
  end

  def destroy
    Review.destroy(params[:review_id])
    redirect_to "/shelters/#{params[:id]}"
  end

  def edit
    @shelter_id = params[:shelter_id]
    @review = Review.find(params[:review_id])
  end

def update
  review = Review.find(params[:review_id])
  review.update(review_params)
  redirect_to "/shelters/#{params[:shelter_id]}"
end

  private
    def review_params
      params.permit(:title, :rating, :content)
    end

end
