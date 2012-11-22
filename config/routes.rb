Bidsy::Application.routes.draw do

  root to: 'auth#link'
  match "auth/:service/callback" => "auth#callback"
  match "logout"                 => "auth#logout"

end
