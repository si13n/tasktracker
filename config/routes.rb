Rails.application.routes.draw do
  devise_for :users
  root 'tasks#index'

  resources :tasks do
    resources :tags
    resources :comments
  end
  resources :users do
    member do
      delete :delete_avatar
    end
  end
end
