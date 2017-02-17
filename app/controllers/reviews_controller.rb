class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.cocktail = Cocktail.find(params[:cocktail_id])

    if @review.save
      redirect_to cocktail_path(id: params[:cocktail_id])
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
