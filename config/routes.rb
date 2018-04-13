Rails.application.routes.draw do
  resources :project_fundings
  resources :project_promises
  resources :project_media
  resources :projects
  resources :categories
  resources :users
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
