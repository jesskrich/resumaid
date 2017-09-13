Rails.application.routes.draw do
    resources :cover_letters, only: [:new, :edit, :index, :show, :update, :create, :destroy]
    resources :posts do
        resources :comments
    end
    root "posts#index"
    get '/about', to: 'pages#about'
    get '/resume', to: 'pages#resume'
    get '/cover_letter', to: 'cover_letters#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
