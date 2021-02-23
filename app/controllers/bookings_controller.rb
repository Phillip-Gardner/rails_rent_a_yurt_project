class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def edit
  end

  def update
    @booking.update(booking_params)

    redirect_to booking_path(@booking.id)
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:booked_from, :booked_to, :total_cost, :user_id, :yurt_id)
  end
end
