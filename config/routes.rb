Rails.application.routes.draw do
  resources :project_fundings
  resources :project_promises
  resources :project_media
  resources :projects
  resources :categories
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
