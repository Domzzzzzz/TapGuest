Rails.application.routes.draw do

  devise_for :admins, :controllers => { registrations: 'registrations' }
  devise_for :users

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    delete '/logout' => 'devise/sessions#destroy'
  end

  resources :user, :controller => 'users'
  post 'user', to: 'users#create', as: :create_user
  delete 'user/:id', to: 'users#destroy', as: :delete_user
  resources :locations, except: [:index, :show]
  get 'dashaboard', to: 'landing#dashboard', as: :dashboard
  root 'landing#index'

end
