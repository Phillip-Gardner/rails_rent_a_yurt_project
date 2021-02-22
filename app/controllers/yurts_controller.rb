class YurtsController < ApplicationController
# dependent on users controller feature
skip_before_action :authenticate_user!, only: :index, :show
  
  def index
    @yurts = Yurt.all
  end
  
  def show
    @yurt = Yurt.find(params[:id])
  end
end