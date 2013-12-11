LeagueStats::Application.routes.draw do
  root to: "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  get "/dashboard", to: "users#show", as: :dashboard
  resources :users, except: :show

  get "/:server/:name", to: "summoners#show", as: :summoner
  # get "/:server/:name/edit", to: "summoners#edit", as: :edit_summoner
  # patch "/:server/:name", to: "summoners#update"
  # put "/:server/:name", to: "summoners#update"
  delete "/:server/:name", to: "summoners#destroy"
  resources :summoners, except: [:show, :edit, :update, :destroy]

  get "/:server/:name/:game_num", to: "games#show", as: :game
  # get "/:server/:name/:game_num/edit", to: "games#edit", as: :edit_game
  # patch "/:server/:name/:game_num", to: "games#update"
  # put "/:server/:name/:game_num", to: "games#update"
  delete "/:server/:name/:game_num", to: "games#destroy"
  resources :games, except: [:show, :edit, :update, :destroy]
end