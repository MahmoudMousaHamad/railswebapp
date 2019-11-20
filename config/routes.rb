Rails.application.routes.draw do
  get 'country_references/index'
  get 'country_references/show'
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
    resources :country_references
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
  resources :books do
    collection do
      get :search
    end
  end
  resources :issues
  resources :academic_papers

  resources :subjects, param: :name
  resources :authors, param: :name

  get '/library', to: 'library#index'
  get '/library/browse', to: 'library#browse'
  get 'library/basic_search', to: 'library#basic_search'
  
  root 'home#index'
end
