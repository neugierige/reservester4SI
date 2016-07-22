class Restaurant < ActiveRecord::Base

	validates_presence_of :name
	belongs_to :owner, class_name: "User"
	has_many :reservations
	
end
