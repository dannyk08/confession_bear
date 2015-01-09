Rails.application.routes.draw do
  # root directory
  root 'users#index'
  # sets all routes
  resources :users
  resources :confessions

  # session routes
  get     '/login'  => 'sessions#new'
  post    '/login'  => 'sessions#create'
  delete  '/logout' => 'sessions#destroy'

  # user routes
  get '/edit_profile/:id', to: 'users#edit',  as: 'edit_profile'
  get '/signup',           to: 'users#new',   as: 'signup'
  get '/profile',          to: 'users#show',  as: 'profile'

end
