Bidsy::Application.routes.draw do

  root to: 'auth#link'
  match "logout"                 => "auth#logout"
  match "auth/:service/callback" => "auth#callback"

  match "/posts" => "posts#index", via: :get
  match "/post"  => "posts#new", via: :get, as: "new_post"
  match "/post"  => "posts#create", via: :post, as: "create_post"
  match "users/:user_id/posts/:id" => "posts#show", via: :get, as: "post"
  match "users/:user_id/posts/:id" => "posts#destroy", via: :delete, as: "delete_post"

end
