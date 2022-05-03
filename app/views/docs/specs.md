
# Specifications

> A tenant should be able to request a list of questions in json format from a RESTful read-only api.

> They should also be able to request a single question.

> Each questions should include: the user who asked it, and a list of answers.

> Each answer should also include the user who posted it.

> The Api should not return private questions.

> Requests should require a valid Tenant api_key tp be processed.

> The API should count how many request each tenant makes.

> The root url should display a HTML dashboard page.

> The dashboard should display: the number of users, the number of public questions, and the number of public answers.

> The dash board should also display each tenant and the number of requests they have made.

<input id="1-done" type="checkbox" checked>
<label for="1-done">Done</label>

## Extra Specifications

> The questions index should be paginated

> The response should also include links to previous and next pages

> A tenant should be able to search questions

> Their query should filter by either the questions.title or an associated answers.body

> If no results are found then it should return an appropriate status code

<input id="2-done" type="checkbox" checked>
<label for="2-done">Done</label>

## Unimplemented Extra Specifications

> When a Tenant reaches 100 requests within a day 

> then throttle that tenant to 1 request every 10 seconds.


