Rails.application.routes.draw do

  resources :payments
  devise_for :users

  get 'admins/show'

  get 'dashboard', to: "admins#show"

  #get 'admins/stats'

  get 'welcome/index'
  # get 'campaigns/:id/search' to: ''

  root to: "welcome#index"

  resources :campaigns do 
  	resources :subscribers, only: [:new, :create]
  	resources :prizes
  end 
 
  get 'campaigns/:id/stats', to: "campaigns#stats", as: "stats"
  get 'campaigns/:id/admin', to: "campaigns#admin", as: "admin"
  get 'campaigns/:id/activate', to: 'campaigns#activate', as: "activate"


end