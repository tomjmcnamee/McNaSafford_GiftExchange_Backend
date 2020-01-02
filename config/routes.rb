Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do
      get 'wishlist/:userid', to: 'wish_list#showallforuser'
      get '/autologin', to: "auth#create"
      get '/switchUser/:userid', to: "user#switchUser"
      get '/event', to: "event#eventGetterWishlists"
      post '/event', to: "event#create"
      post '/login', to:"auth#login"
      post '/accounts', to:"account#create"
      post '/user', to:"user#create"
      post '/wishlist', to: 'wish_list#create'
      delete '/wishlist', to: 'wish_list#destroy'
    end
  end
end