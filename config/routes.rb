Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    post '/users/sign_up' => 'devise/registrations#create'

  end


  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:show]
  resources :users do
    post :login, on: :collection, as: :login
  end

  root to: "pages#home"
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/users/:id', to: 'users#show'
end
