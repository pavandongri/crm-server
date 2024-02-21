Rails.application.routes.draw do
root 'welcome#index'  

devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
  get '/contacts', to: 'contacts#current_user_contacts'
  get '/contact/:id', to: 'contacts#contact_details'
  put '/contact', to: 'contacts#create'
  put '/contact/:id', to: 'contacts#update'
  delete '/contact/:id', to: 'contacts#destroy'

  get '/profile', to: 'users#profile'
  put '/profile/update', to: 'users#update'
  delete 'profile/delete', to: 'users#destroy'


  put '/meeting/create', to: 'meetings#create'
  get '/meetings', to: 'meetings#index'
  get '/meeting/:id', to: 'meetings#show'
  put '/meeting/:id', to: 'meetings#update'
  delete '/meeting/:id', to: 'meetings#destroy'
end
