class CreateCarLists < ActiveRecord::Migration
  def change
    create_table :car_lists do |t|
      t.string :name
      t.integer :service_id

      t.timestamps null: false
    end
  end
end
