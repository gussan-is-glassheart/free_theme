class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  before_action :require_not_logged_in, only: %i[new create]
  before_action :not_temporary_account, only: %i[create]

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to theme_boards_path, success: t('.success')
    else
      flash.now[:error] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to login_path, success: t('.success')
  end

  private

  def not_temporary_account
    user = User.find_by(email: params[:email])
    if user&.temporary == true
      flash.now[:error] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end
end
