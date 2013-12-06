LeagueStats::Application.routes.draw do
  resources :summoners

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users, except: :show
  get "/dashboard", to: "users#show", as: :dashboard
end