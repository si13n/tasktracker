Rails.application.routes.draw do
  devise_for :users
  root 'tasks#index'

  resources :tasks
  resources :users  do
    member do
      delete :delete_avatar
    end
  end
end
