Rails.application.routes.draw do
  resources :event_volunteers
  resources :event_details
  resources :events
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "events#index"
end
