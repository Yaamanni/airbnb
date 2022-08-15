class ReviewsController < ApplicationController
  def index
    @reviews = Reviews.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params[:review])
    @review.save
  end
end
