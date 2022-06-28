Rails.application.routes.draw do
  resources :libraries
  resources :authors
  resources :books
  root 'welcome#index'

  namespace :api do
    resources :libraries
    resources :authors
    resources :books
  end
end
