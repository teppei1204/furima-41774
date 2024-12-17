class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :index]
  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
    @shipping_costs = ShippingCost.all
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :category, :condition, :shipping_cost, :prefecture_id,
                                 :shipping_day_id, :shipping_id)
  end
end
