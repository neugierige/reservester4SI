class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show]
  before_action :get_restaurant

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
    @reservation = @restaurant.reservations.new
  end

  def create
    @reservation = @restaurant.reservations.new(reservation_params)
    
    if reservation_conflict?(@reservation)
      flash[:warning] = "you already have a reservation at this time"
      redirect_to new_restaurant_reservation_path
    else
      @reservation.save
      flash[:success] = "reservation saved"
    end
  end

  def edit
  end

  def update
  end

  def destroy
    if @reservation.destroy
      flash[:danger] = "reservation was deleted"
    else
      flash[:danger] = "reservation was not deleted"
    end
    redirect_to root_path
  end


  private

  def reservation_params
    params.
      require(:reservation).
      permit(:email, :message, :party_size, :date, 
        :time, :reservation_datetime, :restaurant_id).
      merge({user_id: current_user.id})
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def get_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def reservation_conflict?(new_reservation)
    current_user.reservations.any? do | reservation |
      new_reservation.reservation_datetime == reservation.reservation_datetime
    end
  end


end
