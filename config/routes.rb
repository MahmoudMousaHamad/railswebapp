Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :countries do
    resources :cities do
      resources :sites
    end
  end

  resources :cities

  resources :publishers
  resources :journals
  resources :books
  resources :issues

  get '/library', to: 'library#index'
  get '/library/browse', to: 'library#browse'
  
  root 'home#index'
end
