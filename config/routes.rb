Rails.application.routes.draw do
  scope '/api/v1' do
    get 'question/:id', to: 'questions#show'
    get 'questions', to: 'questions#index'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
