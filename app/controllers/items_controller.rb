class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # def index
  #   @items = Item.all
  # end

  # def new
  #   @item = Item.new
  # end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to root_path
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # private

  # def user_params
  #   params.require(:user).permit(:email, :password, :password_confirmation)
  # end
end
