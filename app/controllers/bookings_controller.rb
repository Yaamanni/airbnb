class BookingsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_booking, only: %i[ show edit update destroy ]

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1 or /bookings/1.json
  def show
    @listing = Listing.find params[:listing_id]
  end

  # GET /bookings/new
  def new
    @listing = Listing.find params[:listing_id]
    @booking = Booking.new
    @booking.listing = @listing
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  def create
    @listing = Listing.find params[:listing_id]
    @booking = Booking.new(booking_params)
    # @booking.user = User.first
    @booking.listing = @listing

    respond_to do |format|
      if @booking.save
        format.html { redirect_to listing_booking_path(@listing, @booking), notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking)
          .permit(:start_date, :end_date, :num_of_guests)
  end
end
