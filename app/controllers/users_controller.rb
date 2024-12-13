class UsersController < ApplicationController
  def create
    logger.debug "User params: #{user_params.inspect}"
  end

  private

  def user_params
    params.require(:user).permit(:nick_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_day, :email,
                                 :password, :password_confirmation)
  end
end
