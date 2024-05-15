Rails.application.routes.draw do

  api_version(:module => "V1", :path => {:value => "v1"}) do
    resources :publishing_companies
    resources :authors
    resources :kinds
    
    resources :books do
      resource :kind
      resource :publishing_company
      resource :author
    end
  end

  api_version(:module => "V2", :path => {:value => "v2"}) do
    resources :reviews
    resources :publishing_companies
    resources :authors
    resources :kinds
    
    resources :books do
      resource :kind
      resource :publishing_company
      resource :author
    end
  end
  mount_devise_token_auth_for 'User', at: 'auth'

  resource :auths, only: [:create]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
