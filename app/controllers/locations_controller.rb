
get '/locations' do 
	erb :'locations/_new'
end 

post '/locations' do
  @users = User.select { |user| user.location == params[:location]}
  @venues = Venue.select { |venue| venue.location == params[:location]}

  erb :'locations/show'
end

