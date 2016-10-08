Rails.application.routes.draw do

  get '/about',           to: "static#about"
  get '/contact',         to: "static#contact"
  get '/help',            to: "static#help"
  get '/home',            to: "static#home"
  get '/pricing',         to: "static#pricing"
  get '/privacy',         to: "static#privacy"
  get '/terms',           to: "static#terms"
  get '/sweet_thanks',    to: "static#sweet_thanks"
  get 'static/sample'

  resources :orgs
  resources :vehicles

  as :user do
    patch '/user/confirmation' => 'confirmations#update', :via => :patch, :as => :update_user_confirmation
  end

  devise_for :users, controllers: { confirmations: 'confirmations' }


  mount Galleriable::Engine => "/galleriable"

  root 'static#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
