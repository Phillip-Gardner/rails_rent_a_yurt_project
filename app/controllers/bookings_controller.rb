class BookingsController < ApplicationController

before_action :find_booking, only: [:show, :destroy]
before_action :find_yurt, only: [:index, :create, :new]


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

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @yurt = Yurt.find(params[:yurt_id])
    @booking.yurt = @yurt
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking.id)
    else
      redirect_to yurt_path(@yurt.id)
    end
  end

private

def booking_params
  params.require(:booking).permit(:booked_from, :booked_to, :total_cost, :user_id, :yurt_id)
end

end

def find_yurt
  @yurt = Yurt.find(params[:yurt_id])
end

def find_booking
  @booking = Booking.find(params[:id])
end

end

