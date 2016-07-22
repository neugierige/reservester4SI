class OwnersController < ApplicationController
	before_action :authenticate_owner!

	def dashboard
		@owner = current_owner
		# render ____
	end

end
