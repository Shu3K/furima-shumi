class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
  end
end
