class ChangeDateTimeFormat < ActiveRecord::Migration
  def up
  	add_column :reservations, :reservation_datetime, :datetime
  	execute "UPDATE reservations SET reservation_datetime = CAST(CONCAT(cast(reservation_date AS varchar) || 'T' || cast(reservation_time AS varchar)) as timestamp)"
  	remove_column :reservations, :reservation_date, :date
  	remove_column :reservations, :reservation_time, :time
  end

  def down
  	remove_column :reservations, :reservation_datetime, :datetime
  	add_column :reservations, :reservation_date, :date
  	add_column :reservations, :reservation_time, :time
  end

end
