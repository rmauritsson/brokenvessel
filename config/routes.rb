Rails.application.routes.draw do
  devise_for :users, controller: { registrations: 'registrations' }

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
    get 'logout', to: 'devise/sessions#destroy'
  end

  root 'pages#home'
  get '/assignment', to: 'pages#assignment'

  namespace :admin do
    root 'application#index'

    resources :users
  end
end
