class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    @items = Item.order(created_at: :desc)
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :shipping_cost_id, :shipping_day_id, :category_id, :prefecture_id,
                                 :condition_id, :image)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def correct_user
    return if current_user.id == @item.user.id

    redirect_to root_path
  end
end
