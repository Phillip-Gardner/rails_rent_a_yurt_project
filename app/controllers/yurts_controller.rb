class YurtsController < ApplicationController
  def index
    @yurts = Yurt.all
  end
end
