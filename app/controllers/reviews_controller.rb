class ReviewsController < ApplicationController
  def destroy
    Review.destroy(params[:review_id])
    redirect_to "/shelters/#{params[:id]}"
  end

  def edit
    @id = params[:id]
    @review = Review.find(params[:review_id])
  end

  def update
    review = Review.find(params[:review_id])
    review.update(review_params)
    redirect_to "/shelters/#{params[:id]}"
  end

  private

    def review_params
      params.permit(:title, :rating, :content)
    end
end
