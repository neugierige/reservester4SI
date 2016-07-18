class Reservation < ActiveRecord::Base

	belongs_to :user
	belongs_to :restaurant
	validates_presence_of :restaurant, dependent: :destory
	# validates_presence_of :datetime

	def reservation_datetime
	end

	def reservation_datetime=
	end

end

