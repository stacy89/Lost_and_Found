get '/' do 
	erb :'users/index'
end 

get '/users' do 
	# @user = User.all # Do I really need this?
	erb :'users/index'
end

get '/users/new' do 
	erb :'users/new'
end

post '/users' do 
	@user = User.new(params[:user])
	if @user.save 
		redirect "/users/#{@user.id}"
	else
		@errors = @user.errors.full_messages
		erb :'users/new'
	end
end

get '/users/:id' do 
	@user = User.find(params[:id])
	redirect '/sessions/new' unless logged_in?
	erb :'sessions/show'
end