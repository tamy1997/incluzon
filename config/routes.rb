Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
   }

  resources :homes
  resources :colleges
  resources :students do 
    collection { post :import }
  end
  get '/export_list',to: 'students#export_list'
  get '/city',to: "homes#city"
  root 'homes#dashboard'
  post '/confirm',to: "colleges#confirm"
  get 'cities/:state', to: 'homes#city'
  
  # match '/confirm',to: 'users/registrations#confirm', via: [:get, :post]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
