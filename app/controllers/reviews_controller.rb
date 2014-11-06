class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(review_params)
    @review.user = current_user
    if @review.save
      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end

   def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.find(params[:id])
    @review.destroy
    flash[:notice] = 'Review deleted successfully'
    redirect_to '/restaurants'
  end
end
