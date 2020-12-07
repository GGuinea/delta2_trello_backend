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
      get "/board/:id", to: "boards#get_board"
      get "/get_users/:id", to: "boards#get_users"
      post "/boards", to: "boards#create"
      patch "/board/:id", to: "boards#update_board"
      patch "/board/member/:id", to: "boards#add_member"
      patch "/board/member/:board_id/:user_id", to: "boards#add_member_by_id"
      delete "/board/member/:board_id/:user_id", to: "boards#remove_member"
      delete "/board/:id", to: "boards#remove_board"
      resources :columns
      get "/board/columns", to: "columns#index"
      get "/:board_id/columns", to: "columns#get_columns_for_board"
      post "/:board_id/column", to: "columns#create"
      patch "/column/:id", to: "columns#update_column"
      delete "/column/:id", to: "columns#remove_column"
      resources :cards
      get ":column_id/cards", to: "cards#get_cards_for_column"
      post ":column_id/card", to: "cards#add_to_board"
      patch "/card/:id", to: "cards#update_card"
      delete "/card/:id", to: "cards#remove_card"
    end
  end
end
