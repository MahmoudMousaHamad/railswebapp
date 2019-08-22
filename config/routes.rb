Rails.application.routes.draw do
  get 'pictures/index'
  get 'videos/index'
  get 'schools/index'
  get 'schools/show'
  get 'colleges/index'
  get 'colleges/show'
  get 'universities/index'
  get 'universities/show'
  get 'posts/index'
  get 'posts/show'
  get 'scholarships/index'
  get 'scholarships/show'
  get 'conferences/index'
  get 'conferences/show'
  get 'museums/index'
  get 'museums/show'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :countries do
    resources :museums
    resources :conferences
    resources :scholarships
    resources :posts
    resources :pictures
    resources :videos
    resources :universities do
      resources :colleges do
        resources :schools
      end
    end
    resources :cities do
      resources :sites
    end
  end

  resources :universities
  resources :colleges

  resources :cities

  resources :publishers
  resources :journals
  resources :books
  resources :issues

  resources :subjects, param: :name

  
  get '/library', to: 'library#index'
  get '/library/browse', to: 'library#browse'
  
  root 'home#index'
end
