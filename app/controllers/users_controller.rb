class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      set_session(@user)
      redirect_to links_path
    else
      flash[:error] = @user.errors.to_a
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require('user').permit(:email, :password, :password_confirmation)
  end
end
