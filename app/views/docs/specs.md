
# Specifications

A tenant should be able to request a list of questions in json format from a RESTful read-only api.

They should also be able to request a single question.

Each questions should include: the user who asked it, and a list of answers.

Each answer should also include the user who posted it.

The Api should not return private questions.

Requests should require a valid Tenant api_key tp be processed.

The API should count how many request each tenant makes.

The root url should display a HTML dashboard page.

The dashboard should display: the number of users, the number of public questions, and the number of public answers.

The dash board should also display each tenant and the number of requests they have made.


## Extra Specifications (not currently implemented)

When a query parameter is provided to the questions request
then it should filter the given results by the question title and answers body.

If no results are found then it should return an appropriate status code.

When a Tenant reaches 100 requests within 24 hours, 
then throttle that tenant to 1 request per 10 seconds.

