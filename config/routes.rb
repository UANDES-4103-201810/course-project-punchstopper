Rails.application.routes.draw do

  devise_for :users
  resources :user_wishlists
  get 'welcome/index'
  
  get 'admin', to: 'users#admin'
  get 'make_outstanding', to: 'projects#make_outstanding'
  get 'add_to_wishlist', to: 'projects#add_to_wishlist'
  get '/projects/:project_id/add_funding', to: 'projects#add_funding', as: 'add_funding'
  post 'projects/:project_id/create_funding', to: 'projects#create_funding'
  get 'fund_through_promise', to: 'projects#fund_through_promise'
  get '/projects/:project_id/add_promise', to: 'projects#add_promise', as: 'add_promise'
  post '/projects/:project_id/create_promise', to: 'projects#create_promise'
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
