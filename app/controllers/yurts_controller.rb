class YurtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_yurt, only: [:show, :destroy]

  def index
    @yurts = Yurt.all
  end

  def show
  end

  def new
    @yurt = Yurt.new
  end

  def create
    @yurt = Yurt.new(yurt_params)
    @yurt.user = current_user
    if @yurt.save
      redirect_to yurt_path(@yurt), alert: "Creation successful"
    else
      render :new
    end
  end

  def destroy
    @yurt.destroy
    redirect_to yurts_path, alert: "Deletion successful - Yurt deleted"
  end

  private

  def find_yurt
    @yurt = Yurt.find(params[:id])
  end

  def yurt_params
    params.require(:yurt).permit(:title, :description, :location, :max_capacity, :day_rate)
  end
end
