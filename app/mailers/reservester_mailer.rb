class ReservesterMailer < ApplicationMailer

	def test_reservation_created
		@cool = "cool variable"
		mail(to: 'lxing.nyc@gmail.com', subject: 'Reservation confirmed')
	end


	def reservation_created(reservation)
		@datetime = reservation.reservation_datetime
		mail(to: reservation.restaurant.owner.email, subject: 'Reservation confirmed')
	end

end
