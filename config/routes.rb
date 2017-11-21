Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :sellers
  resources :invoices, only: [:new, :create]
  resources :expenses, only: [:new, :create, :index]

  mount Attachinary::Engine => "/attachinary"
end
