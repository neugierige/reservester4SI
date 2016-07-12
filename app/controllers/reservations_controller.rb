class ReservationsController < ApplicationController

  before_action :set_reservation, only: [:show]
  before_action :get_restaurant, only: [:new, :create, :edit, :destroy]

  def index
    @reservation = Reservation.all
  end

  def show
    if @reservation
      render :show
    else
      flash[:danger] = "nope"
    end
  end

  def new
    # @reservation = @restaurant.reservations.new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @restaurant = Restaurant.find_by_id(@reservation.restaurant_id)
    if @reservation.save
      flash[:success] = "reservation saved"

      redirect_to @restaurant
    else
      flash[:warning] = "whoops"
      redirect_to new_restaurant_reservation_path
    end

    # @reservation = @restaurant.reservations.create(params[:reservation_id])
    # if @reservation.save
    #   redirect_to restaurant_reservations_path(@restaurant)
    # else
    #   flash[:danger] = "Reservation was not saved. Please try again."
    #   redirect_to restaurant_path(@restaurant)
    # end

  end

  def edit
  end

  def update
  end

  def destroy
    if @restaurant.destroy
      flash[:danger] = "reservation was deleted"
    else
      flash[:danger] = "reservation was not deleted"
    end
    redirect_to root_path
  end


  private

  def reservation_params
    params.require(:reservation).permit(:email, :message, :reservation_date, :reservation_time, :restaurant_id)
  end

  def set_reservation
    @reservation = Reservation.find(params[:restaurant_id])
  end

  def get_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end



end
