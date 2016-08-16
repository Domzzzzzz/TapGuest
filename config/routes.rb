Rails.application.routes.draw do

  devise_for :admins, :controllers => { registrations: 'registrations' }
  devise_for :users, :controllers => { registrations: 'users' }
  resources :locations, except: [:index, :show]
  get 'dashaboard', to: 'landing#dashboard', as: :dashboard
  root 'landing#index'

end
