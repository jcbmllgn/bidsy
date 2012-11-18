require 'rubygems'
require 'fileutils'
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

class Post
  attr_reader :title, :description, :starting_price, :current_price, :fields,
    :img_path, :profile

  @@field_options = [
    'condition',
    'manufacturer',
    'year'
  ]

  def initialize( profile, img_path, params )
    @img_path = img_path
    @title = params['title']
    @description = params['description']
    @starting_price = params['starting-price'].to_i
    @current_price = @starting_price

    # save the creator
    @profile = profile

    @fields = { }
    params['fields'].each do |key, value|
      @fields[key] = value
    end
  end

end

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
get "/post/:profile_id/:id" do
  @post = DATA[params["profile_id"]][params["id"].to_i]
  erb :'posts/show'
end

# create item
post "/post/create" do
  authorize!

  if params['image']
    # make dir if it aint there
    unless File.exists? File.join('lib', 'public', 'uploaded_files')
      Dir.mkdir File.join('lib', 'public', 'uploaded_files')
    end

    # take the given image and move it somewhere we can serve it.
    name = "#{params['image'][:filename]}_#{@profile['id']}"
    path = File.join 'lib', 'public', 'uploaded_files', name
    FileUtils.cp params['image'][:tempfile], path

    img_path = File.join '/', 'uploaded_files', name
  end

  # give this user a space in out array if they don't have one.
  unless DATA[@profile['id']]
    DATA[@profile['id']] = []
  end

  # add the new post to the DATA hash
  DATA[@profile['id']] << Post.new(@profile, img_path, params)

  redirect "/post/#{@profile['id']}/#{DATA[@profile['id']].size - 1}"
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