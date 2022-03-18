Rails.application.routes.draw do
  mount EpiCas::Engine, at: "/"
  devise_for :users
  resources :posts do
    collection do
      get :search
      post :search_result
    end
  end

  resources :categories, except: [:destroy, :show]
  resources :audits, only: [:index]

  get "/403", to: "errors#error_403"
  get "/404", to: "errors#error_404"
  get "/422", to: "errors#error_422"
  get "/500", to: "errors#error_500"

  resources :users, only: [:edit, :update]
  root to: "posts#index"
end
