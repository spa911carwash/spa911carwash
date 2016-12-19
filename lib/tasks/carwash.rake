namespace :spa911carwash do

  task add_service: :environment do
  	[["gold-spa-interior-hatchback",599], ["gold-spa-interior-sedan",699],["gold-spa-interior-suv",899],["gold-spa-exterior-hatchback",599], ["gold-spa-exterior-sedan",699],["gold-spa-exterior-suv",899]].each do |service|
  		p  Service.create(name: service.first, price:service.last )
  	end
	end
end