ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
  :port => 587,
  :domain => 'spa911.herokuapp.com',
  :user_name => "spa911forcar@gmail.com",
  :password => "spa911forcar123",
  :authentication => :plain,
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
#Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?