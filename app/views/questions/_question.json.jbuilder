json.extract! question, :id, :title, :user, :created_at, :updated_at

json.answers question.answers, partial: "answers/answer", as: :answer, cached: true

json.url question_url(question, format: :json)

