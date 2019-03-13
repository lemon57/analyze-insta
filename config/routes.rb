Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root   "scans#new"
  post   "scans",             to: "scans#create"

  get    "posts",             to: "posts#index"

  get    "accounts",          to: "accounts#index"
  get    'accounts/new',      to: 'accounts#new'
  post   "accounts",          to: "accounts#create"
  get    "accounts/:id",      to: "accounts#show"

  resources :accounts
  resources :posts


end
