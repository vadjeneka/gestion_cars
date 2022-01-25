Rails.application.routes.draw do
  root to: 'inscriptions#index'
  resources :inscriptions, only: [:index, :show, :create, :new]
end
