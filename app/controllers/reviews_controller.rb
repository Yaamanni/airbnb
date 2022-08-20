class ReviewsController < ApplicationController
  # skip_before_action :authenticate_user!
  before_action :set_review, only: %i[ show edit update destroy ]

  # GET /reviews or /reviews.json
  def index
    @reviews = Review.where(listing_id: params[:listing_id])
    @listing = Listing.find(params[:listing_id])
  end

  # GET /reviews/1 or /reviews/1.json
  def show
    # @listing = Listing.find(params[:listing_id])
    # @review = Review.find(params[:id])
    @reviews = Review.where(listing_id: params[:id])
  end

  # GET /reviews/new
  def new
    @booking = Booking.find(params[:booking_id])
    @listing = Listing.find(params[:listing_id])
    @review = Review.new
    @review.listing = @listing
    @review.booking = @booking
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.listing = @listing
    @review.booking = @booking

    respond_to do |format|
      if @review.save!
        format.html { redirect_to listing_booking_path(@listing, @booking), notice: "Review was successfully created." }
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
