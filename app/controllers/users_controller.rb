class UsersController < ApplicationController
  def show
  end

  def edit
  @user = User.new(units: cookies[:units] || "mmol/L", hbA1c: cookies[:hbA1c] || "%")
  end

  def create
    cookies[:units] = user_params[:units]
    cookies[:hbA1c] = user_params[:hbA1c]
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:units, :hbA1c)
  end
end
