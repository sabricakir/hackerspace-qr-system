Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  
  
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, except:[:index]

  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'

  root to: "pages/home#index"
  get '/about', to: 'pages/about#index'
  get '/contact', to: 'pages/contact#index'
end
