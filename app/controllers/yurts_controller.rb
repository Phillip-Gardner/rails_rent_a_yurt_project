class YurtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @yurts = Yurt.all
  end

  def show
    @yurt = Yurt.find(params[:id])
  end

  def new
    # raise
    # @user = User.find(params[:user_id])
    @yurt = Yurt.new
  end

  def create
    @yurt = Yurt.new(yurt_params)
    @yurt.user = current_user
    if @yurt.save
      redirect_to yurt_path(@yurt)
    else
      render :new
    end
  end

  def destroy
    @yurt = Yurt.find(params[:id])
    @yurt.destroy
    redirect_to yurts_path
  end

  private

  def yurt_params
    params.require(:yurt).permit(:title, :description, :location, :max_capacity, :day_rate)
  end
end
