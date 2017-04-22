get '/venues/_new' do 
	erb :'venues/_new'
end # Not sure if this should point to the user login of the partial

post '/venues' do 
	@venue = Venue.new(params[:venue])
	if @venue.save
		redirect "/venues/#{@venue.id}"
	else
		@errors = @venue.errors.full_messages
		erb :'users/new'
	end
end

get '/venues' do 
	@venue = Venue.find(params[:id])
	redirect '/sessions/new' unless logged_in?
	erb :'venues/show'
end

