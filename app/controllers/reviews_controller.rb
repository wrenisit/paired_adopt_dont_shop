class ReviewsController < ApplicationController
  def destroy
    Review.destroy(params[:review_id])
    redirect_to "/shelters/#{params[:id]}"
  end

<<<<<<< HEAD
  def edit
    @id = params[:id]
    @review = Review.find(params[:review_id])
=======
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
>>>>>>> dc7dbf0a8049820b02cd0f2387e46a0ca6a05eca
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
