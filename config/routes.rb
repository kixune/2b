Rails.application.routes.draw do



  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/help', to: 'static_pages#help'

  get '/register', to: 'users#new'

  get '/login', to: 'sessions#new'
  post'/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  resources :users
  resources :chests
  resources :gemstones
end
