Rails.application.routes.draw do
  root to: 'cocktails#index'

  devise_for :users, skip: :registrations
  devise_scope :user do
    resource :registration,
      only: [:new, :create, :edit, :update],
      path: 'users',
      path_names: { new: 'sign_up' },
      controller: 'devise/registrations',
      as: :user_registration do
        get :cancel
      end
  end

  resources :cocktails do
    resources :doses, only: [:new, :create, :destroy]
    resources :reviews, only: [:create]
  end

  get 'users/:id/cocktails' => 'cocktails#index', as: :user_cocktails
end
