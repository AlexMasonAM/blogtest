Rails.application.routes.draw do

    resources :posts, except: [:edit, :update, :destroy] do 
      
      resources :comments,  only: [:create]
      
    end

    get '/welcome' => "sessions#new"
    post '/welcome' => "sessions#create"

    get '/user' => "sessions#new"
    post '/user' => "sessions#create"
end
