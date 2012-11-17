require 'rubygems'
require "httparty"
require "omniauth-singly"
require "sinatra"
require 'sinatra/static_assets'

# Singly
SINGLY_API = "https://api.singly.com"
SINGLY_ID = "9218ff10ccad13f577faa0e29b4827c1"
SINGLY_SECRET = "30493d0e5acf724c92d10d20a7db80ad"

# Mock a database
# id => [ Posts ]
DATA = { }

# class Post

#   def initialize( id )
#     @id = id
#   end

# end

enable :sessions

use OmniAuth::Builder do
  provider :singly, SINGLY_ID, SINGLY_SECRET
end

before do
  @profile = HTTParty.get(profile_url,
    query: { access_token: session[:access_token] }
  ).parsed_response if session[:access_token]
end

# LANDING ==================================

get "/" do
  erb :index
end

# POSTS ====================================

# post item
get "/post/new" do
  redirect "/profile/new" unless @profile
  erb :'posts/new'
end

# view item
get "/post/:id" do
  @post = "this is a post"
  erb :'posts/show'
end

post "/post/create" do

end

# AUTH =====================================

# login / logout routes
get "/profile/new" do
  erb :'profiles/new'
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

def authorize!
  redirect '/' unless @profile
end

def profile_url
  "#{SINGLY_API}/profile"
end