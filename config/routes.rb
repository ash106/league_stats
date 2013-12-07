LeagueStats::Application.routes.draw do
  root to: "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  get "/dashboard", to: "users#show", as: :dashboard
  resources :users, except: :show

  get "/:server/:name", to: "summoners#show", as: :summoner
  get "/:server/:name/edit", to: "summoners#edit", as: :edit_summoner
  patch "/:server/:name", to: "summoners#update"
  put "/:server/:name", to: "summoners#update"
  delete "/:server/:name", to: "summoners#destroy"
  resources :summoners, except: [:show, :edit, :update, :destroy]
end