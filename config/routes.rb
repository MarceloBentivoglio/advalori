Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: :registrations }

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :user, only: [:show]

  resource :seller, only: [:new, :create, :edit, :update, :show]
  namespace :seller do
    resources :invoices, only: [:new, :create, :index, :show, :destroy]
    resources :expenses, only: [:new, :create, :update, :destroy, :index]
    resources :invoice_payers, only: [:new, :create, :destroy, :show, :index, :edit, :update]
  end

  resource :investor, only: [:new, :create, :update, :show]
  namespace :investor do
    resources :invoices, only: [:index, :show]
  end



  get "expenses_chart", to: 'charts#expenses_chart'
  get "calc_expenses_chart", to: 'charts#calc_expenses_chart'

  mount Attachinary::Engine => "/attachinary"
end
