module ApplicationHelper

	def bootstrap_class_for flash_type
	  { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
	end

	def flash_messages(opts = {})
	  flash.each do |msg_type, message|
	    concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible alert-position", role: 'alert') do
	      concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }) do
	        concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
	        concat content_tag(:span, 'Close', class: 'sr-only')
	      end)
	      concat message
	    end)
	  end
	  nil
	end

	def make_active_to(tab)
		klass = ''
		if tab == 'home' && params[:controller] == 'welcome' && params[:action] == 'index'
			klass = 'class=active'
		elsif tab == 'aboutus' && params[:controller] == 'welcome' && params[:action] == 'aboutus'
			klass = 'class=active'
		elsif tab == 'contactus' && params[:controller] == 'welcome' && params[:action] == 'contactus'
			klass = 'class=active'
		elsif tab == 'services' && params[:controller] == 'services'
			klass = 'class=active'
		elsif tab == 'packages' && params[:controller] == 'packages'
			klass = 'class=active'
		end		
		klass
	end
end
