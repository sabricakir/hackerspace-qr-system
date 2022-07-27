Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: { sessions: "users/sessions" , registrations: "users/registrations"}
  devise_scope :user do
    get '/users/sign_out' => 'users/sessions#destroy'
    post '/users/sign_up' => 'users/registrations#create'
    get '/users/edit/:id' => 'users/registrations#edit'

  end


  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:show]
  resources :users do
    post :login, on: :collection, as: :login
  end

  root to: "pages/home#index"
  get '/about', to: 'pages/about#index'
  get '/contact', to: 'pages/contact#index'
  get '/users/:id', to: 'users#show'
end
