Rails.application.routes.draw do

  get 'dashboard/show'

  get '/about',           to: "static#about"
  get '/contact',         to: "static#contact"
  get '/help',            to: "static#help"
  get '/home',            to: "static#home"
  get '/pricing',         to: "static#pricing"
  get '/privacy',         to: "static#privacy"
  get '/terms',           to: "static#terms"
  get '/sweet_thanks',    to: "static#sweet_thanks"
  get 'static/sample'
  get 'dashboard',        to: "dashboard#show"

  resources :orgs
  resources :vehicles

  devise_for :users

  get '/dashboard' => 'dashboard#show', as: :user_root # creates user_root_path


  mount Galleriable::Engine => "/galleriable"

  Rails.application.routes.draw do
    mount_ember_app :frontend, to: "/frontend"
  end

  root 'static#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
