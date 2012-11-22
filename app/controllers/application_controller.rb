class ApplicationController < ActionController::Base
  protect_from_forgery

  def home
    render :home
  end

  protected

  # All login in is routed through singly
  #
  # Currently supported services:
  # * facebook
  # * linkedin
  #
  # This link will end up at the callback action in
  # the auth controller.
  #
  def auth_path( service )
    "/auth/singly?service=#{service}"
  end
  helper_method :auth_path

  # Returns the current signed in user if there is one.
  #
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

end
