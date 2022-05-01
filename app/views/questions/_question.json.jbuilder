json.extract! question, :id, :title, :user, :answers, :created_at, :updated_at
json.url questions_url(question, format: :json)