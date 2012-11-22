class AuthController < ApplicationController

  # Login Action
  #
  # We will describe what it means to login to the site
  # here and display all possible social login options.
  #
  def login
    render 'application/login'
  end

  # After login in with singly handle fetching or creating a new
  # user from the provided UID and Token.
  #
  # The session variable :user_id is set here as well, this is what
  # all pages use to determain if the visitor is logged in.
  #
  def callback
    auth = request.env["omniauth.auth"]
    user = User.find_or_create_by_uid(auth["uid"])
    user.update_attribute(:token, auth["credentials"]["token"])

    session[:user_id] = user.id
    redirect_to root_url, notice: "Logged In!"
  end

  # Logout Action
  #
  # Clear the session, this will log you out.
  #
  def logout
    reset_session
    redirect_to root_url
  end

end
