Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'users' }
  devise_for :admins, :controllers => { registrations: 'registrations' }
  resources :locations, except: [:index, :show]
  root 'landing#index'

end
