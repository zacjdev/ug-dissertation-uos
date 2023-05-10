Rails.application.routes.draw do
  mount EpiCas::Engine, at: "/"
  devise_for :users

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

  get "lecturer/modules/:id", to: "cmodules#show"

  get "lecturer/add_team", to: "teams#new"
  resources 'teams', :only => [:new, :create, :show, :edit, :update, :destroy]

  get "lecturer/view_team/:id", to: "teams#show"

  get "lecturer/assign_teams", to: "teams#assign"
  post "user_team_linkers", to: "teams#assign_team"

  resources 'user_team_linkers', :only => [:new, :create, :show, :edit, :update, :destroy]
  resources 'reports', :only => [:new, :create, :show, :edit, :update, :destroy]

  get "student/team/:id", to: "students#showteam"

  get "report" => "reports#new"

  get "lecturer/addsurvey", to: "survey_templates#new"

  resources 'survey_templates', :only => [:new, :create, :show, :edit, :update, :destroy]

  get "student/takesurvey/:id", to: "students#takesurvey"

  resources 'survey_responses', :only => [:new, :create, :show, :edit, :update, :destroy]


  get "lecturer/checklist_templates/new", to: "checklist_responses#new"

  post "checklist_templates", to: "checklist_responses#create"

  get "lecturer/checklog/:id", to: "checklog#new"
  resources 'checklogs', :only => [:new, :show, :edit, :update, :destroy]
  post "checklogs", to: "checklog#create"
end
