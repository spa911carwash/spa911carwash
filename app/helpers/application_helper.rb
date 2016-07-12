module ApplicationHelper

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
		end		
		klass
	end
end
