get '/sessions/new' do 
	# if request.xhr?
	# 	erb :'sessions/new', layout: false 
	# else
		erb :'sessions/new'
	# end
end

post '/sessions' do 
	@user = User.find_by(username: params[:username])
	p '*' * 20
	p params[:username]
	p '*' * 20
	p params[:password]
	p '*' * 20
	p @user
	if @user && @user.password == params[:password]
		login(@user)
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