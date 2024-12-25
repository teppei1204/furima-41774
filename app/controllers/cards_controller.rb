class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_item_owner, only: [:index, :new, :create]
  before_action :check_item_sold, only: [:index, :new, :create]
  before_action :set_item, only: [:index, :create]
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @card_form = CardForm.new
  end

  def new
    @card_form = CardForm.new
  end

  def create
    @card_form = CardForm.new(card_form_params)
    if @card_form.valid?
      pay_item
      @card_form.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def card_form_params
    params.require(:card_form).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def card_params
    params.require(:card_form).permit(:price).merge(token: params[:token])
  end

  def check_item_owner
    @item = Item.find(params[:item_id])
    return unless @item.user_id == current_user.id

    redirect_to root_path
  end

  def check_item_sold
    @item = Item.find(params[:item_id])
    return unless @item.sold?

    redirect_to root_path
  end

  def pay_item
    Payjp.api_key = 'sk_test_d19d9dfbb5587ebc7810d4e1' # 自身のPAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: card_form_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end
end
