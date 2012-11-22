module ApplicationHelper

  # All login in is routed through singly
  #
  # Currently supported services:
  # * facebook
  # * linkedin
  #
  # This link will end up at the callback action in
  # the auth controller.
  #
  def login_path( service )
    "/auth/singly?service=#{service}"
  end

  # Returns the current signed in user if there is one.
  #
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
