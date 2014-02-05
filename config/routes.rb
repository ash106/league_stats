LeagueStats::Application.routes.draw do
  root to: "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  get "/dashboard", to: "users#show", as: :dashboard
  resources :users, except: :show

  get "/:server/:riot_id", to: "summoners#show", as: :summoner
  # get "/:server/:riot_id/edit", to: "summoners#edit", as: :edit_summoner
  # patch "/:server/:riot_id", to: "summoners#update"
  # put "/:server/:riot_id", to: "summoners#update"
  delete "/:server/:riot_id", to: "summoners#destroy"
  resources :summoners, except: [:show, :edit, :update, :destroy]

  get "/:server/:riot_id/:game_num", to: "games#show", as: :game
  # get "/:server/:riot_id/:game_num/edit", to: "games#edit", as: :edit_game
  # patch "/:server/:riot_id/:game_num", to: "games#update"
  # put "/:server/:riot_id/:game_num", to: "games#update"
  delete "/:server/:riot_id/:game_num", to: "games#destroy"
  resources :games, except: [:show, :edit, :update, :destroy]
end