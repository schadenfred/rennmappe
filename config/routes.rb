Rails.application.routes.draw do

  get '/about',       to: "static#about"
  get '/contact',     to: "static#contact"
  get '/help',        to: "static#help"
  get '/home',        to: "static#home"
  get '/pricing',     to: "static#pricing"
  get '/privacy',     to: "static#privacy"
  get '/terms',       to: "static#terms"
  get 'static/sample'

  resources :orgs
  resources :vehicles
  devise_for :users
  mount Galleriable::Engine => "/galleriable"

  root 'static#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
