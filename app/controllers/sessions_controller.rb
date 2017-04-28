get '/sessions/new' do 
	# if request.xhr?
	# 	erb :'sessions/new', layout: false 
	# else
		erb :'sessions/new'
	# end
end

post '/sessions' do 
	@user = User.find_by(username: params[:username])
	@venue = Venue.find_by(username: params[:username])
	if @venue && @venue.password == params[:password]
		login_venue(@venue)
		redirect "/venues/#{@venue.id}"
	elsif @user && @user.password == params[:password]
		login_user(@user)
		redirect "/users/#{@user.id}"
	else
		@errors = ['Your username and/or password are incorrect!']
		erb :'sessions/new'
	end
end

delete '/sessions' do 
	logout
	redirect '/'
end