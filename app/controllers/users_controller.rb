class UsersController < ApplicationController
  def show
  end

  def edit
  @user = User.new(units: cookies[:units] || "mmol/L")
  end

  def create
    cookies[:units] = user_params[:units]
    logger.debug cookies
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:units)
  end
end
