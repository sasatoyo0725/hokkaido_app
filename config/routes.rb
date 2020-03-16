Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root 'staticpages#home'
  get  '/help', to: 'staticpages#help'
  get  '/about', to: 'staticpages#about'

  resources :users do
   resources :items, module: 'users', only: :index
 end

  resources :items
end
