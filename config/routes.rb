Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do
      get 'wishlist/:userid', to: 'wish_list#showallforuser'
      get '/autologin', to: "auth#create"
      post '/login', to:"auth#login"
      post '/user_accounts', to:"user_account#create"
    end
  end
end