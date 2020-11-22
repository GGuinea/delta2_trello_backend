Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do 
    namespace 'v1' do
      resources :users, only: [:create]
      post "/login", to: "users#login"
      get "/auto_login", to: "users#auto_login"
      get "/all_boards", to: "users#all_boards"
      resources :boards 
      get "/boards", to: "boards#index"
      get "/get_users/:id", to: "boards#get_users"
      post "/boards", to: "boards#create"
      patch "/board/:id", to: "boards#change_name"
      delete "/board/:id", to: "boards#remove_board"
    end
  end
end
