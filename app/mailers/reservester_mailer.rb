class ReservesterMailer < ApplicationMailer
	def test_reservation_created
		@cool = "cool variable"
		mail(to: 'lxing.nyc@gmail.com', subject: 'Reservation confirmed')
	end


	def reservation_created(reservation)
		@date = reservation.reservation_date
		@time = reservation.reservation_time
		mail(to: @user.email, subject: 'Reservation confirmed')
	end

end
