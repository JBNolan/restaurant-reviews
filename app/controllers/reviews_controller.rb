class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant_id = @restaurant.id

    if @review.save
      flash[:notice] = "Review added successfully"
      redirect_to restaurant_path(@restaurant)
    else
      flash.now[:notice] = @review.errors.full_messages
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
