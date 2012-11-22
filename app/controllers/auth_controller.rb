class AuthController < ApplicationController

  SINGLY_API_BASE = "https://api.singly.com"

  # Link Account Action
  #
  # We will describe what it means to login to the site
  # here and display all possible social login options.
  #
  def link
    render 'site/link_accounts'
  end

  # Login Action
  #
  # -> "/auth/singly?service=#{service}" -> callback
  #
  # Go to singly and authenticate this user with the
  # service they chose.
  #
  def callback
    auth = request.env["omniauth.auth"]
    user = User.find_or_create_by_uid(auth["uid"])
    user.update_attribute(:token, auth["credentials"]["token"])

    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in!"
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
