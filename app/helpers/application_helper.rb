module ApplicationHelper

	def make_active_to(tab)
		klass = ''
		if tab == 'home' && params[:controller] == 'welcome' && params[:action] == 'index'
			klass = 'active'
		elsif tab == 'aboutus' && params[:controller] == 'welcome' && params[:action] == 'aboutus'
			klass = 'active'
		elsif tab == 'contactus' && params[:controller] == 'welcome' && params[:action] == 'contactus'
			klass = 'active'
		elsif tab == 'services' && params[:controller] == 'services'
			klass = 'active'
		end		
		klass
	end
end
