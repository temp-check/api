Rails.application.routes.draw do
  resources :temperatures
  resources :postal_codes
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :locations
    end
  end
end
