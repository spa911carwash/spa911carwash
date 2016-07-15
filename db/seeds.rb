# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Service.delete_all
[["gold-hatchback",499], ["gold-sedan",649],["gold-suv",799],["silver-hatchback",249], ["silver-sedan",299],["silver-suv",349],["platinum-hatchback",999], ["platinum-sedan",1249],["platinum-suv",1599]].each do |service|
	Service.create(name: service.first, price:service.last )
end

["hatchback", "sedan","suv"].each do |service_name|
	Service.create(name: service_name)
end

hatchback_car = Service.find_by_name("hatchback")
sedan_car = Service.find_by_name("sedan")
suv_car = Service.find_by_name("suv")

["Alto","Altok10","A-star","Baleno (new)","Celerio","Eeco","Omni","Ritz","Swift","S-cross","WagonR","Zen Estilo","Zen","Eon","I10","Grand i10","I20","Elite i20","I20 Active","Getz","Santro","Nano","Bolt","Indica (old)","Indica Vista","Spark","Beat","UVA  ","Nissan","Micra","Skoda","Fabia","Brio","Jazz","Figo (old)","Figo (new)","Volkswagen  ","Polo","Polo GT","Cross Polo","Punto","Punto Evo","Aventura","Mahindra","Verito Vibe","KUV 100  ","Toyota","Etios Liva ","Etios Cross ","Datsun","Go","Go Plus","Renault ","Kwid ","Pulse"].each do |car|

	CarList.create(name: car, service_id: hatchback_car.id )
end

["Accent","Accord","Amaze","Aria","Aveo","Beetle","Baleno","Camry","Cedia","City ZX","Civic","Corolla","Eeco","Elantra","Endeavour","Fabia","Fiesta","Fusion","Getz Prime","Jazz","Jetta","Lancer","Laura","Lavida","Lenia","Logan","Octavia","Optra Magnum","Passat","Phaeton","Sharan","Sonata","Swift Dzire","Embera","Superb","SX4","Teana","Touran","Tucson","Volkswagen Vento","Hyundai Verna","Versa","Vetri"].each do |car|

	CarList.create(name: car, service_id: sedan_car.id )
end

["Audi","Bentely","BMW","Mahindra Bolero","Captiva","Honda CRV","Renault Duster","Fortuner","Grand Vitara","Grande","Gypsy","Toyota Innova","Jaguar","Lamborgini","Land Curiser","Mercedes","Montero","Nissan","Outlander","Pajero","Porsche","Range Rover","Rolls Royce","Safari dicor","Santana","Scorpio","Scorpio Getaway","SRV","Sumo Grande","Sumo Vita","SUV","Tavera","Touareg","Xtrail","Xylo"].each do |car|

	CarList.create(name: car, service_id: suv_car.id )
end