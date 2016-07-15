class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :name
      t.integer :contact_number
      t.string :email
      t.text :address
      t.string :landmark
      t.date :date
      t.string :time
      t.integer :service_id

      t.timestamps null: false
    end
  end
end
