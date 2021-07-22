Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :roasters, only: [:index, :show, :update, :destroy] do
    resources :roasts do
    resources :comments
    end
  end

  resources :sessions, only: [:create]
  resources :photos
  resources :registrations, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  
end

