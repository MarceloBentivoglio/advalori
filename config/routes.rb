Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :sellers
  resources :invoice_payers, only: [:new, :create, :destroy, :show]

  resources :invoices, only: [:new, :create, :index]
  resources :expenses, only: [:new, :create, :update, :destroy, :index]

  mount Attachinary::Engine => "/attachinary"
end
