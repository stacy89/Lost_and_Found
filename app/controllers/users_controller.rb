get '/' do 
	erb :'users/index'
end 

get '/users' do 
	# @user = User.all 
	erb :'users/index'
end

get '/users/new' do 
	erb :'users/new'
end

post '/users' do 
	@user = User.new(params[:user])
	if @user.save 
		redirect "/sessions/new"
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

#add delete/edit route to edit favorites page but only when user is logined in

#route to up date profile page

#paperclip to allow user to upload profile image
