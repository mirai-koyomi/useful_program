Rails.application.routes.draw do
  resources :users
  resources :dictionaries
  resources :millsec_converts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
