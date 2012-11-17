require 'rubygems'
require "httparty"
require "sinatra"
require "omniauth-singly"

# Singly
SINGLY_API = "https://api.singly.com"
SINGLY_ID = "9218ff10ccad13f577faa0e29b4827c1"
SINGLY_SECRET = "30493d0e5acf724c92d10d20a7db80ad"

# Mock a database
# id => [Posts]
DATA = { }

enable :sessions

use OmniAuth::Builder do
  provider :singly, SINGLY_ID, SINGLY_SECRET
end

before do
  @profile = HTTParty.get(profile_url,
    query: { access_token: session[:access_token] }
  ).parsed_response if session[:access_token]
end

# landing page
get "/" do
  erb :index
end

# post item
get "/post/new" do
  redirect "/profile/new" unless @profile
  erb :new_post
end

# view item
get "/post/:id" do
  @post = "this is a post"
  erb :post
end

# login / logout routes
get "/profile/new" do
  erb :new_profile
end

get "/auth/singly/callback" do
  auth = request.env["omniauth.auth"]
  session[:access_token] = auth.credentials.token
  redirect "/"
end

get "/logout" do
  session.clear
  redirect "/"
end

def profile_url
  "#{SINGLY_API}/profile"
end