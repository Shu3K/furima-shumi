class ItemsController < ApplicationController
  def index
  end

  def new
    @items = item.new
  end
end
