class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.integer :team_id

      t.timestamps null: false
    end
  end
end
