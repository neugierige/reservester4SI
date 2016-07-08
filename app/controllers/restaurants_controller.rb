class RestaurantsController < ApplicationController
  before_action :authenticate_owner!, except: [:show, :index]
  before_action :set_restaurant, only: [:show]


  def index
    @restaurants = Restaurant.all
  end

  def show
    # @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = current_owner.restaurants.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant = current_owner.restaurants.new(restaurant_params)
    if @restaurant.save
      flash[:success] = "#{@restaurant.name} saved!"
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def edit
    if current_owner == @restaurant.owner
      @restaurant = current_owner.restaurants.find(params[:id])
    end
  end

  def update
    @restaurant = current_owner.restaurants.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant = current_owner.restaurants.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :address, :phone)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end


end
