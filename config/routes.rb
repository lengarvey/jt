Jt::Application.routes.draw do
  resources :accounts
  root :to => "accounts#index"
end
