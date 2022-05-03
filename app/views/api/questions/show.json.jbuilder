
json._embedded do
  json.question do
    json.partial! "api/questions/question", question: @question, cached: true
  end
end

