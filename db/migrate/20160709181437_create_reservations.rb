class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.string :email
      t.text :message
      t.date :reservation_date
      t.time :reservation_time

      t.timestamps null: false
    end
  end
end
