# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Service.delete_all
[["gold-spa-hatchback",499], ["gold-spa-sedan",649],["gold-spa-suv",799],["silver-spa-hatchback",249], ["silver-spa-sedan",299],["silver-spa-suv",349],["platinum-spa-hatchback",999], ["platinum-spa-sedan",1249],["platinum-spa-suv",1599]].each do |service|
	Service.create(name: service.first, price:service.last )
end

["hatchback", "sedan","suv"].each do |service_name|
	Service.create(name: service_name)
end

hatchback_car = Service.find_by_name("hatchback")
sedan_car = Service.find_by_name("sedan")
suv_car = Service.find_by_name("suv")

CarList.delete_all

["Alto","Altok10","A-star","Baleno (new)","Celerio","Eeco","Omni","Ritz","Swift","S-cross","WagonR","Zen Estilo","Zen","Eon","I10","Grand i10","I20","Elite i20","I20 Active","Getz","Santro","Nano","Bolt","Indica (old)","Indica Vista","Spark","Beat","UVA  ","Nissan","Micra","Skoda","Fabia","Brio","Jazz","Figo (old)","Figo (new)","Volkswagen  ","Polo","Polo GT","Cross Polo","Punto","Punto Evo","Aventura","Mahindra","Verito Vibe","KUV 100  ","Toyota","Etios Liva ","Etios Cross ","Datsun","Go","Go Plus","Renault ","Kwid ","Pulse"].each do |car|

	CarList.create(name: car, service_id: hatchback_car.id )
end

["Accent","Accord","Amaze","Aria","Aveo","Beetle","Baleno","Camry","Cedia","City ZX","Civic","Corolla","Eeco","Elantra","Endeavour","Fabia","Fiesta","Fusion","Getz Prime","Jazz","Jetta","Lancer","Laura","Lavida","Lenia","Logan","Octavia","Optra Magnum","Passat","Phaeton","Sharan","Sonata","Swift Dzire","Embera","Superb","SX4","Teana","Touran","Tucson","Volkswagen Vento","Hyundai Verna","Versa","Vetri","Audi A3","Audi S3","Audi A4","Audi S4","Audi A6","Audi S6","Audi A7","Audi S7","Audi RS 7","Audi A8 L","Audi A8 L W12","Audi S8","BMW 3 Series","BMW 5 Series","BMW Active Hybrid","BMW 7 Series","BMW M5","BMW M3","Mercedes  C Class","Mercedes   S CLass","Mercedes  E Class","Mercedes   B Class","Mercedes CLA"].each do |car|

	CarList.create(name: car, service_id: sedan_car.id )
end

["Mahindra Bolero","Captiva","Honda CRV","Renault Duster","Fortuner","Grand Vitara","Grande","Gypsy","Toyota Innova","Creta.","EcoSport.","Land Curiser","Scorpio.","Montero","Mahindra XUV500.","Outlander","Pajero","Mahindra TUV300.","Range Rover","Mahindra Thar.","Safari dicor","Santana","Scorpio Getaway","SRV","Sumo Grande","Sumo Vita","Tavera","Touareg","Xtrail","Xylo","Audi A3 Sportback e-tron","Audi Allroad","Audi Q3","Audi Q5","Audi Q7","BMW X1","BMW X3","BMW X4","BMW X5","BMW X6","Mercedes  GLA","Mercedes GLE","Mercedes GLS","Mercedes GLC"].each do |car|

	CarList.create(name: car, service_id: suv_car.id )
end

AdminUser.delete_all
AdminUser.create!(email: 'spa911carwash@gmail.com', password: 'spa911carwash321', password_confirmation: 'spa911carwash321')