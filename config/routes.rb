Bidsy::Application.routes.draw do

  # Site
  root to: 'auth#login'

  # Auth
  match "logout"                 => "auth#logout"
  match "auth/:service/callback" => "auth#callback"

  # Posts
  match "/posts"                   => "posts#index", via: :get
  match "/post"                    => "posts#new", via: :get, as: "new_post"
  match "/post"                    => "posts#create", via: :post, as: "create_post"
  match "users/:user_id/posts/:id" => "posts#show", via: :get, as: "post"
  match "/posts/:id"               => "posts#destroy", via: :delete, as: "delete_post"

end
