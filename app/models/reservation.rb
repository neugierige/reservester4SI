class Reservation < ActiveRecord::Base

	belongs_to :user
	belongs_to :restaurant
	validates_presence_of :restaurant, dependent: :destory
	# validates_presence_of :reservation_datetime

	def reservation_datetime=
		reservation_datetime = Date.parse("#{date}" + "#{time}")
		save!
	end

	def date
		reservation_datetime.present? ? reservation_datetime.strftime('%b %e %Y') : ''
	end

	# def date=(date)
	# 	if date != ''
	# 		new_date = Date.parse(date)
	# 	end
	# end

  def date=(date)
    if date != ''
      new_date = Date.parse(date)
      existing_time = reservation_datetime.present? ? reservation_datetime : Time.zone.now
      self.reservation_datetime = DateTime.new(new_date.year, new_date.month, new_date.day, existing_time.hour, existing_time.min, existing_time.sec, existing_time.zone)
    end
  end


	def time
		reservation_datetime.present? ? reservation_datetime.strftime('%l:%M %P').strip : ''
	end

	# def time=(time)
	# 	if time != ''
	# 		new_time = Time.zone.parse(time)
	# 	end
	# end

  def time=(time)
    if time != ''
      new_time = Time.zone.parse(time)
      existing_date = reservation_datetime.present? ? reservation_datetime : Time.zone.now
      self.reservation_datetime = DateTime.new(existing_date.year, existing_date.month, existing_date.day, new_time.hour, new_time.min, new_time.sec, new_time.zone)
    end
  end


end

