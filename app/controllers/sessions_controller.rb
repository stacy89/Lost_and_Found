get '/sessions/new' do 
	erb :'sessions/new'
end

post '/sessions' do 
	@user = User.find_by(email: params[:email])
	if @user && @user.password == params[:password]
		session[:id] = @user.id
		redirect "/users/#{@user.id}"
	else
		@errors = ['Your username and/or password are incorrect!']
		erb :'sessions/new'
	end
end

delete '/sessions/:id' do 
	session[:id] = nil
	redirect '/sessions/new'
end