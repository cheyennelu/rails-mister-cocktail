class ReviewsController < ApplicationController

  def create
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new(strong_params)
    @review.cocktail = @cocktail
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to cocktail_path(@review.cocktail)
  end

  private

  def strong_params
    params.require(:review).permit(:content, :rating)
  end
end
