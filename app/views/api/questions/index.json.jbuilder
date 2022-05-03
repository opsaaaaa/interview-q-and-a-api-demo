
json.count @questions.count
json.total Question.published.count
json.pages @questions.total_pages
json._embedded do
  json.questions do
    json.array! @questions, partial: "api/questions/question", as: :question, cached: true
  end
end
json._links do
  json.next { json.href api_questions_url(page: @questions.next_page) } unless @questions.last_page?
  json.prev { json.href api_questions_url(page: @questions.prev_page) } unless @questions.first_page?
  json.last { json.href api_questions_url(page: @questions.total_pages) }
  json.first { json.href api_questions_url }
end
