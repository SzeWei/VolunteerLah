Rails.application.routes.draw do
  resources :profiles
  resources :organisation_profiles
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :searches
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  # devise_scope :user do
  # 	delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
end
