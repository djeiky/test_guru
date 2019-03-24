Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_names: {sign_in: :log_in, sign_out: :log_out}
  root to: 'tests#index'
  
  get 'badges/index'
  get '/user_badges', to: "badges#user_badges"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tests, only: :index do
    resources :questions, shallow: true, only: :show

    member do
      post :start
    end
  end

  resources :test_passages, only: [:show, :update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :badges, except: [:show]
    resources :gists, only: [:index]
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
  end

  get 'feedback/new'
  post 'feedback/send_email'

end
