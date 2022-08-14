class ListingsController < ApplicationController
  skip_before_action :authenticate_user!
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

    respond_to do |format|
      if @listing.save
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
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
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  def destroy
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.fetch(:listing, {})
    # params.require(:listing).permit(:title, :num_of_rooms, :num_of_beds, :description, :start_date, :end_date, :price, :num_of_guests)
  end
end
