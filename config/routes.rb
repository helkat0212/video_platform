Rails.application.routes.draw do
  devise_for :users
  
  # Root and locale routes
  root 'home#index'
  get 'home', to: 'home#index', as: :home
  get 'about', to: 'home#about'
  get '/locale/:locale', to: 'application#switch_locale', as: :switch_locale # Changed path

  # Scoped routes under locale
  scope "(:locale)", locale: /en|uk/ do
    # Video routes with nested comments
    resources :videos do
      resources :comments, shallow: true
    end

    # User routes
    resources :users do
      resources :videos, shallow: true
      resources :subscriptions, only: [:index]
    end

    # Channel routes
    resources :channels do
      resources :videos, shallow: true
      resources :subscriptions, shallow: true
    end

    # Standalone resources
    resources :payments
    resources :reports
  end
end
