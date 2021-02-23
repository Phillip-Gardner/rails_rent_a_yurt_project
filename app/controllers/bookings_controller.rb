class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :destroy, :edit]
  before_action :find_yurt, only: [:create, :new]

  def index
    array = Booking.all
    @bookings = array.select { |booking| booking.user_id == current_user.id }
  end

  def show
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking.id), alert: "Update successful"
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.yurt = @yurt
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking.id), alert: "Booking successful"
    else
      redirect_to yurt_path(@yurt.id), alert: "Booking failed"
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, alert: "Deletion successful - Booking deleted"
  end

  private

  def booking_params
    params.require(:booking).permit(:booked_from, :booked_to, :total_cost, :user_id, :yurt_id)
  end

  def find_yurt
    @yurt = Yurt.find(params[:yurt_id])
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
