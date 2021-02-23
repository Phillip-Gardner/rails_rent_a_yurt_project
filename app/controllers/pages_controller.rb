class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @user = current_user
    @yurts = Yurt.where(user: @user)
    @bookings = Booking.where(user: @user)
  end
end
