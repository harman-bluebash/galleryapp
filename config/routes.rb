Rails.application.routes.draw do

 
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
 end
  root"home#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :albums
  
  get 'tags/:tag', to: 'albums#index', as: :tag

  # Defines the root path route ("/")
 
end
