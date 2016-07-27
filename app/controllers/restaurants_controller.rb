class RestaurantsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_restaurant, only: [:show]


  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = current_user.restaurants.new
  end

  def create
    @restaurant = current_user.restaurants.new(restaurant_params)
    if @restaurant.save
      flash[:success] = "#{@restaurant.name} saved!"
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def edit
    @restaurant = current_user.restaurants.find(params[:id])
    authorize! :edit, @restaurant
  end

  def update
    @restaurant = current_user.restaurants.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant = current_user.restaurants.find(params[:id])
    if @restaurant.destroy
      flash[:danger] = "restaurant was deleted"
    else
      flash[:danger] = "restaurant was not deleted"
    end
    redirect_to restaurants_path
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :address, :phone, category_ids: [])
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end


end
