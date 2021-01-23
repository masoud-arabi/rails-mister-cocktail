Rails.application.routes.draw do
  root to: 'cocktails#home'
  resources :cocktails, only: [:index, :show, :new, :create, :edit, :update] do
    resources :doses, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
end
