Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, controllers: { sessions: 'users/sessions', confirmations: 'users/confirmations', registrations: 'users/registrations' }, 
             path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  resources :feedbacks, only: %i[new create]
  resources :gists, only: :create
  resources :badges, only: %i[index show]

  namespace :admin do
    resources :gists, only: :index
    resources :badges
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
