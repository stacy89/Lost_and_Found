get '/' do 
	erb :'users/index'
end 

get '/users' do 
	erb :'users/index'
end

get '/users/new' do 
	erb :'users/new'
end

post '/users' do 
	@user = User.new(params[:user])

	if @user.save 
		redirect '/sessions/new'
	else
		@errors = @user.errors.full_messages
		erb :'users/new'
	end
end

get '/users/:id' do 
	@user = User.find(params[:id])
	redirect '/sessions/new' unless user_logged_in?
	erb :'sessions/show'
end


