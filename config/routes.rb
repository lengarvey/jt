Jt::Application.routes.draw do
  match "accounts/signup/:uuid" => "accounts#signup_with_uuid", :as => 'account_by_uuid'
  resources :accounts
  root :to => "accounts#index"
end
