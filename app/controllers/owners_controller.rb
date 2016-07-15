class OwnersController < ApplicationController
	before_action :authenticate_owner!

	def dashboard
		@owner = current_owner
		@restaurant = current_owner.restaurants
	end

end
