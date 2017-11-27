Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: :registrations }

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :user, only: [:show] do
    resources :sellers, only: [:new, :create, :update, :show]
    resources :investors, only: [:new, :create, :update, :show]
    resources :invoice_payers, only: [:new, :create, :destroy, :show, :index]
    resources :invoices, only: [:new, :create, :index, :show, :destroy]
    resources :expenses, only: [:new, :create, :update, :destroy, :index]
  end



  get "expenses_chart", to: 'charts#expenses_chart'
  get "calc_expenses_chart", to: 'charts#calc_expenses_chart'

  mount Attachinary::Engine => "/attachinary"
end
