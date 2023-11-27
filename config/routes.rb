Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :postal_codes
      resources :locations
      resources :temperatures
    end
  end
end
