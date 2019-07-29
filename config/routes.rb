Rails.application.routes.draw do
  resources :publishers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :countries do
    resources :cities do
      resources :sites
    end
  end

  resources :cities

  resources :publishers

  resources :journals do 
    resources :issues
  end

  resources :books

  root 'home#index'
end
