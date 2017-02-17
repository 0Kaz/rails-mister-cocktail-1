Rails.application.routes.draw do
  root to: 'cocktails#index'

  resources :cocktails do
    resources :doses, only: [:new, :create, :destroy]
    resources :reviews, only: [:create]
  end
end
