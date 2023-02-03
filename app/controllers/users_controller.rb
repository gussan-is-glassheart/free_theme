class UsersController < ApplicationController
  #skip_before_action :require_login, only: %i(new create)
  #before_action :require_not_logged_in, only: %i(new create)

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #auto_login(@user)
      redirect_to login_path, success: t('.success')
    else
      flash.now[:error] = t('.fail')
      render :new
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(user).permit(:email, :name, :password, :password_confirmation)
  end
end
