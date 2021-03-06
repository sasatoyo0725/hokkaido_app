Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  root 'staticpages#home'
  get  '/help', to: 'staticpages#help'
  get  '/about', to: 'staticpages#about'

  resources :users do
    resources :items, module: 'users', only: [:index]
    member do
      get :following, :followers
    end
  end

  resources :items
  resources :comments, only: [:new, :create]
  resources :relationships, only: [:create, :destroy]
  resources :categories, only: [:show]
  get 'likes/index'
  post '/likes', to: 'likes#create'
  delete '/likes', to: 'likes#destroy'
end
