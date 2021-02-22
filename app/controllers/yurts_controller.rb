class YurtsController < ApplicationController

  # dependent on users controller feature
  # skip_before_action :authenticate_user!, only: :index

  def index
    @yurts = Yurt.all
  end
end
