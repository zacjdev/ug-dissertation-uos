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

  
  # route for the lecturer home page /dashboard
  get "dashboard", to: "lecturer#home"

  get "lecturer/surveys", to: "lecturer#surveys"
  get "lecturer/checklists", to: "lecturer#checklists"
  get "lecturer/users", to: "lecturer#users"
  get "home", to: "students#home"

  get "lecturer/modules/add", to: "cmodules#new"

  get "lecturer/modules", to: "lecturer#modules"
  resources 'cmodules', :only => [:new, :create, :show, :edit, :update, :destroy]
end
