Rails.application.routes.draw do
  scope '/api/v1' do
    get 'question/:id', to: 'questions#show', as: 'question'
    get 'questions', to: 'questions#index', as: 'questions'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
