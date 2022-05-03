Rails.application.routes.draw do
  
  get 'docs/notes'
  get 'docs/specs'
  get 'docs/assessment'
  
  get '/', to: 'dashboards#home', as: 'dashboard_home'

  namespace :api do
    get 'questions/:id', to: 'questions#show', as: 'question'
    get 'questions', to: 'questions#index', as: 'questions'
    get 'questions/search/:q', to: 'questions#search', as: 'questions_search'
  end

end
