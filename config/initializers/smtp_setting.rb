ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
  :port => 587,
  :domain => 'spa911carwash.in',
  #:user_name => "spa911forcar@gmail.com",
  #:password => "spa911forcar123",
  :user_name => "spa911carwash@gmail.com",
  :password => "spa911carwash321",
  :authentication => :plain,
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
#Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?