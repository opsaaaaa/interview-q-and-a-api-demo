json.extract! question, :id, :title, :user, :created_at, :updated_at
json.answers question.answers, partial: "api/answers/answer", as: :answer, cached: true

json._links do
  json.self do
    json.href api_question_url(question, format: :json)
  end
end

