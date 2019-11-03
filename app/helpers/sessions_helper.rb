module SessionsHelper

  # Logs in the given user.
  def log_in(user)
      # place the user’s id securely in the temporary session
      session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
     if session[:user_id]
       # this will will hit the DB if @current_user hasn’t yet been
       # assigned or return the exist @current_user
       @current_user ||= User.find_by(id: session[:user_id])
     end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

 # Returns true if the user is logged in, false otherwise.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
