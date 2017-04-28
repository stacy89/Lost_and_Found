get '/venues/_new' do 
	erb :'venues/_new'
end 

post '/venues' do 
	@venue = Venue.new(params[:venue])
	if @venue.save
		redirect "/sessions/new"
	else
		@errors = @venue.errors.full_messages
		erb :'users/new'
	end
end

get '/venues/:id' do 
	@venue = Venue.find(params[:id])
	redirect '/sessions/new' unless venue_logged_in?
	erb :'sessions/show'
end

#venues/:id





#add delete/edit route to edit whole page but only when user is logined in

#paperclip for venue to up load their image of location

#strech for using mapbox to pin point venue location