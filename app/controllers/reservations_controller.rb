class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show]
  before_action :get_restaurant

  def index
    @reservation = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
    # logger.debug @reservation.inspect
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

    if @reservation.save
      flash[:success] = "reservation saved"

      # send email here
      ReservesterMailer.reservation_created(@reservation).deliver_later

      redirect_to restaurant_reservation_path(@restaurant, @reservation)
    else
      flash[:warning] = "whoops"
      redirect_to new_restaurant_reservation_path
    end

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
    params.require(:reservation).permit(:email, :message, :party_size, :reservation_datetime, :restaurant_id)
  end

  def set_reservation
    @reservation = Reservation.find(params[:restaurant_id])
  end

  def get_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end



end
