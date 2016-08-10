Rails.application.routes.draw do

  devise_for :admins, :controllers => { registrations: 'registrations' }

  resources :locations, except: [:index, :show, :destroy] do
    resource :admins, except: [:index, :show, :destroy]
  end

  root 'landing#index'

end
