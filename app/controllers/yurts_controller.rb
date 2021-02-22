class YurtsController < ApplicationController
  def show
    @yurt = Yurt.find(params[:id])
  end
end
