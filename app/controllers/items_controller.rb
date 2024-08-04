class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def item_params
    params.require(:item).permit(:category_id, :condition_id, :prefecture_id, :payment_id, :day_id, :image, :name, :explain, :price).merge(user_id: current_user.id)
  end
end
