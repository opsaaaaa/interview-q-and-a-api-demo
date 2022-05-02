Rails.application.routes.draw do
  namespace :api do
    get 'question/:id', to: 'questions#show', as: 'question'
    get 'questions', to: 'questions#index', as: 'questions'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
