get '/venues/new' do 
	erb :'venues/new'
end 

post 'venues' do 
	@venue = Venue.new(params[:venue])
	if @venue.save
		redirect "/venues/#{@venue.id}"
	else
		@errors = @venue.errors.full_messages
		erb :'venues/new'
	end
end

