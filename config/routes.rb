# config/routes.rb
Rails.application.routes.draw do
  devise_for :users

  concern :user_resources do
    resources :channels
    resources :videos
    resources :comments
    resources :subscriptions
    resources :payments
    resources :reports
  end

  resources :users, concerns: :user_resources
  resources :channels do
    member { post 'subscribe' }
    collection { get 'my_subscriptions' }
    resources :subscriptions
  end

  resources :videos
  resources :comments
  resources :subscriptions
  resources :payments
  resources :reports

  get 'home', to: 'home#index', as: 'home'
  get 'about', to: 'home#about', as: 'about'
  get '/switch_locale/:locale', to: 'application#switch_locale', as: :switch_locale

  scope "(:locale)", locale: /en|uk/ do
    # локалізовані маршрути
  end

  root 'home#index'
end
