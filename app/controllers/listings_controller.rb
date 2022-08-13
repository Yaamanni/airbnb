class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit update destroy]

  # GET /listings
  def index
    @listings = Listing.all
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # POST /articles
  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to @listing, notice: "Listing was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /listings/1
  def show
  end

  # GET /listings/1/edit
  def edit
  end

  # PATCH /articles/1
  def update
    if @listing.update(listing_params)
      redirect_to @listing, notice: "Listing was successfully created."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @listing.destroy
    redirect_to listings_path, notice: "Listing was deleted."
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:title, :num_of_rooms, :num_of_beds, :description, :start_date, :end_date, :price, :num_of_guests)
  end
end
