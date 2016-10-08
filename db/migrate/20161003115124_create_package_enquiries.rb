class CreatePackageEnquiries < ActiveRecord::Migration
  def change
    create_table :package_enquiries do |t|
      t.string :package_type
      t.string :name
      t.string :email
      t.integer :phone_number, limit: 8

      t.timestamps null: false
    end
  end
end
