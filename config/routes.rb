Rails.application.routes.draw do
<<<<<<< HEAD
  get 'welcome/index'

  resources :categories
  resources :users
  root 'welcome#index'
=======
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
>>>>>>> ca76921b1c94d56fd1cec109c2970700540b8c5e
end
