class UsersController < ApplicationController
  def show
  end

  def edit
  @user = User.new(units: 'mgdL')
  end

  def update
  end
end
