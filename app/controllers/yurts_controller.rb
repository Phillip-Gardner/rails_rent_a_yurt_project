class YurtsController < ApplicationController
  
skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @yurts = Yurt.all
  end

  def show
    @yurt = Yurt.find(params[:id])
  end
end
