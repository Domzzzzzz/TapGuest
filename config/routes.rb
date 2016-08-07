Rails.application.routes.draw do

  devise_for :admins, :controllers => { registrations: 'registrations' }
  resources :locations 
  root 'landing#index'

end
