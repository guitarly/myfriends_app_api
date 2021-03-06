Rails.application.routes.draw do
   root 'welcome#index'
  resources :users do
      resources :friends
    collection do
      post '/login', to: 'users#login'
    end
  end

  get '/sendText', to: 'sendsms#new'
  post '/sendText', to: 'sendsms#sendText'
  post '/sendEmail', to: 'sendsms#sendEmail'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
