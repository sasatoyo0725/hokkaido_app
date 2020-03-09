Rails.application.routes.draw do
  devise_for :users

  root 'staticpages#home'
  get  '/help', to: 'staticpages#help'
  get  '/about', to: 'staticpages#about'
  resources :users, only: [:show]
end
