Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :countries do
    resources :cities do
      resources :sites
    end
  end

  resources :cities

  root 'home#index'
end
