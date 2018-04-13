Rails.application.routes.draw do
  get 'welcome/index'

  resources :categories
  resources :users
  root 'welcome#index'
end
