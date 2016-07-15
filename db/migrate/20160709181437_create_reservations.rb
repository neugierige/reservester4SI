class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :restaurant, index: true, foreign_key: true
      t.string :email
      t.text :message
      t.date :reservation_date
      t.time :reservation_time
      t.integer :party_size
      t.timestamps null: false
    end
  end
end
