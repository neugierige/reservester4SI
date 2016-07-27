class Restaurant < ActiveRecord::Base

	validates_presence_of :name
	
	belongs_to :owner, class_name: "User"
	has_many :reservations
	has_and_belongs_to_many :categories

	before_save :ensure_owner_is_actually_an_owner
	
	def ensure_owner_is_actually_an_owner
	  if owner.owner? || owner.admin?
	  	true
	  else
	  	errors.add(:owner_id, :invalid, message: "not an owner")
	  	false
	  end
	end
end
