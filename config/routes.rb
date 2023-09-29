Rails.application.routes.draw do
  resources :offers
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'profile/:id', to: 'users#show', as: 'profile'
  get 'admin_new_user', to: 'users#admin_new_user', as: 'admin_new_user'
  post 'admin_create_user', to: 'users#admin_create_user', as: 'admin_create_user'
  delete 'admin_delete_user/:id', to: 'users#admin_delete_user', as: 'admin_delete_user'
  resources :postulations, only: :create
  root "home#index"
end

