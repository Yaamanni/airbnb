class ReviewsController < ApplicationController
  # skip_before_action :authenticate_user!
  before_action :set_review, only: %i[ show edit update destroy ]

  # GET /reviews or /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1 or /reviews/1.json
  def show
    @listing = Listing.find(params[:listing_id])
    @review = Review.find(params[:id])
  end

  # GET /reviews/new
  def new
    @listing = Listing.find(params[:listing_id])
    @review = Review.new
    @review.listing = @listing
  end

  # GET /reviews/1/edit
  def edit
    @review = Review.find(params[:id])
  end

  # POST /reviews or /reviews.json
  def create
    puts params[:listing_id]
    @listing = Listing.find(params[:listing_id])
    @review = Review.new(review_params)
    @review.listing = @listing
    @review.booking = @listing.bookings.first

    respond_to do |format|
      if @review.save
        format.html { redirect_to listing_review_path(@review, @review.booking), notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to review_url(@review), notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
