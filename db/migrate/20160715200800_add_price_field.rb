class AddPriceField < ActiveRecord::Migration
  def change
  	add_column :services, :price, :integer
  end
end
