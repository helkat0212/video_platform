Rails.application.routes.draw do
  devise_for :users
  
  # Home routes
  get 'home', to: 'home#index', as: 'home'
  get 'about', to: 'home#about', as: 'about'
  
  # User routes
  resources :users do
    resources :channels
    resources :videos
    resources :comments
    resources :subscriptions
    resources :payments
    resources :reports
  end
  
  # Channel routes
  resources :users do
    resources :subscriptions, only: [:index]  # Nested route for subscriptions
  end
  resources :users do
     resources :videos
  end
  resources :channels do
    member do
      post 'subscribe'
    end
    collection do
      get 'my_subscriptions'
    end
    resources :subscriptions
  end
  resources :channels do
    member do
      post 'subscribe' => 'channels#subscribe'
    end
  end
  resources :users do
    member do
      get 'subscriptions' => 'subscriptions#index', as: :subscriptions
    end
  end

  # Additional model routes
  resources :channels
  resources :videos
  resources :comments
  resources :subscriptions
  resources :payments
  resources :reports

  scope "(:locale)", locale: /en|uk/ do
    
  end
  

  root 'home#index'  # Define a root path if needed
end
