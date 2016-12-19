Rails.application.routes.draw do
# modal#Event
  # resources :event_details
  resources :comments

  get '/events/getnear', to: "events#getnear", as: 'get_near_event'
  resources :events do 
  	resources :event_volunteers, only: [:create, :update]
  end

  # resources :profiles
  # resources :organisation_profiles
  devise_for :users, :controllers => { registrations: "users/registrations", omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users, only: [:show, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static#home"

  get '/csr', to: 'static#csr' 

end
