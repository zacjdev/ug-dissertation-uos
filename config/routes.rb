Rails.application.routes.draw do
  mount EpiCas::Engine, at: "/"
  devise_for :users


  resources :categories, except: [:destroy, :show]
  resources :audits, only: [:index]

  get "/403", to: "errors#error_4F03"
  get "/404", to: "errors#error_404"
  get "/422", to: "errors#error_422"
  get "/500", to: "errors#error_500"

  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
  end

  resources :users, only: [:edit, :update]

  root to: "index#index"
end
