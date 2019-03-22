Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_names: {sign_in: :log_in, sign_out: :log_out}
  root to: 'tests#index'

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
    resources :gists, only: [:index]
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
  end
end
