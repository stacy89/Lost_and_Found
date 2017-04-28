helpers do
  def login_user(user)
    session[:user_id] = user.id
  end

   def login_venue(venue)
    session[:venue_id] = venue.id
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_venue
    @current_user ||= Venue.find(session[:venue_id]) if session[:venue_id]
  end

  def user_logged_in?
    !!current_user
  end

  def venue_logged_in?
    !!current_venue
  end

  def user_logout
    session[:user_id] = nil
  end

  def venue_logout
    session[:venue_id] = nil
  end
end



