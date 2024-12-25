class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :redirect_if_sold_out, only: [:edit]

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

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :shipping_cost_id, :shipping_day_id, :category_id, :prefecture_id,
                                 :condition_id, :image)
          .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def correct_user
    return if current_user.id == @item.user.id

    redirect_to root_path
  end

  def redirect_if_sold_out
    return unless @item.sold? && current_user.id == @item.user_id

    redirect_to root_path
  end
end
