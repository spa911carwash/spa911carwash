namespace :spa911carwash do

  task add_service: :environment do
  	[["gold-spa-interior-hatchback",599], ["gold-spa-interior-sedan",699],["gold-spa-interior-suv",899],["gold-spa-exterior-hatchback",599], ["gold-spa-exterior-sedan",699],["gold-spa-exterior-suv",899]].each do |service|
  		p  Service.create(name: service.first, price:service.last )
  	end
	end

	task update_service_price: :environment do
		Service.delete_all
		[["silver-spa-hatchback",199], ["silver-spa-sedan",249],["silver-spa-suv",299],["platinum-spa-hatchback",1499], ["platinum-spa-sedan",1699],["platinum-spa-suv",1999],["gold-spa-interior-hatchback",799], ["gold-spa-interior-sedan",899],["gold-spa-interior-suv",999],["gold-spa-exterior-hatchback",799], ["gold-spa-exterior-sedan",899],["gold-spa-exterior-suv",999]].each do |service|
			Service.create(name: service.first, price:service.last )
		end

		["hatchback", "sedan","suv"].each do |service_name|
			Service.create(name: service_name)
		end
	end
end