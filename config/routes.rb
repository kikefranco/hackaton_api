Rails.application.routes.draw do
  resources :users do
    collection do
      get 'search_by_name'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'assets', to: 'assets#show'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'ping#ping'
end
