Rails.application.routes.draw do

  devise_for :users
  resources :user_wishlists
  get 'welcome/index'
  
  get 'admin', to: 'users#admin'

  resources :project_fundings
  resources :project_promises
  resources :project_media
  resources :projects
  resources :categories
  resources :users do
    resources :projects do
      resources :project_promises
      resources :project_fundings
      resources :project_media
    end
  end
  resources :projects do
    resources :project_promises
    resources :project_fundings
    resources :project_media
  end
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
