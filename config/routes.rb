Rails.application.routes.draw do

  devise_for :admins, :controllers => { registrations: 'registrations' }
  resources :location 
  root 'landing#index'

end
