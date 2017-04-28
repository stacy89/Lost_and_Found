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
		name: Faker::Hipster.word,
		location: "San Francisco",
		email: Faker::Internet.email,
		password: "poop")
end 

User.all.each do |user|
  5.times do
    Favorite.create(user_id: user.id, venue_id: Venue.all.sample.id)
  end
end