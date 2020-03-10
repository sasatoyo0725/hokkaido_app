Rails.application.routes.draw do
  devise_for :users, controlelrs: {
          registrations: 'users/registrations'
  }

  root 'staticpages#home'
  get  '/help', to: 'staticpages#help'
  get  '/about', to: 'staticpages#about'
  resources :users, only: [:show]
end
