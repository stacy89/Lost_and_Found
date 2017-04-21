require 'faker'

User.destroy_all
Venue.destroy_all
Favorite.destroy_all

until User.count > 10 do 
	User.create(
		username: Faker::Internet.user_name, 
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name, 
		location: "San Francisco",
		email: Faker::Internet.email,
		password: "poop")
end

until Venue.count > 50 do 
	Venue.create(
		username: Faker::Internet.user_name, 
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		name: Faker::Hipster.word,
		location: "San Francisco",
		email: Faker::Internet.email,
		password: "poop")
end 

User.all.each do |user|
	10.times do 
	Favorite.create(
		user_id: User.all.sample)
	end
end

	Venue.all.each do |venue|
	50.times do 
	Favorite.create( 
		venue_id: Venue.all.sample)
	end
end