class EmailFormatValidator < ActiveModel::Validator
	def validate_each(object, attribute, value)
		unless valud ~= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
			object.error[attribute] << (options[:message] || "not a real email")
		end
	end
end