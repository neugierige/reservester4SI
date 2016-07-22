class UsersController < ApplicationController
  before_action :authenticate_owner!

  def dashboard
    debugger
    @user = current_user
    if @user.owner?
      @restaurant = current_user.restaurants
      render "owner_dashboard"
    elsif @user.admin?
      render "admin_dashboard"
    else
      render "user_dashboard"
    end
  end

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
