Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources         :championships do
    resources :weeks
  end

  resources :weeks, only: [] do
    resources :matches
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "dashboard"  => "dashboard#index"
  get "dashboard_search" => "dashboard#search"
end
