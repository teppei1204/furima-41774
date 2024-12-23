class CardsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @card_form = CardForm.new
  end

  def new
    @item = Item.find(params[:item_id])
    @card_form = CardForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @card_form = CardForm.new(card_form_params)
    if @card_form.valid?
      @card_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def card_form_params
    params.require(:card_form).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id]
    )
  end
end
