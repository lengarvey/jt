Jt::Application.routes.draw do
  get "sessions/new"

  match "accounts/signup/:uuid" => "accounts#signup_with_uuid", :as => 'account_by_uuid'
  resources :accounts do
    resources :jobs
  end
  get "log_in" => "sessions#new", :as => "log_in" 
  resources :sessions

  root :to => "accounts#index"
end
