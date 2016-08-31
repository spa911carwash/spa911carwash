ActiveAdmin.register Booking do
	
	permit_params :name,:contact_number,:email,:address,:landmark,:date,:first_half,:second_half,:third_half,:actual_price

	# See permitted parameters documentation:
	# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
	#
	# permit_params :list, :of, :attributes, :on, :model
	#
	# or
	#
	# permit_params do
	#   permitted = [:permitted, :attributes]
	#   permitted << :other if params[:action] == 'create' && current_user.admin?
	#   permitted
	# end

	index do
	  column :name
	  column :contact_number
	  column :price
	  column :actual_price

	  actions :defaults => false do |booking|
      link_to 'Edit', edit_admin_booking_path(booking)
      #link_to 'Delete', admin_booking_path(booking), :method => :delete, :confirm => "Are you sure"
    end
	end 

end
