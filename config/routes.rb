Rails.application.routes.draw do
# modal#Event
  resources :event_volunteers
  resources :event_details
  resources :events
  devise_for :users

  resources :profiles
  resources :organisation_profiles
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "events#index"

  # devise_scope :user do
  # 	delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
end
