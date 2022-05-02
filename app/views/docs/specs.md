
# Specifications

A tenant should be able to request a list of questions in json format from a RESTful read-only api.

They should also be able to request a single question.

Each questions should include: the user who asked it;
and a list answers.

Each answer should also include the user who posted it.

The Api should not return private questions.

Requests should require a valid Tenant api_key tp be processed.

The API should count how many request each tenant makes.

The root url should display a HTML dashboard page.

The dashboard should display: the number of users; the number of public questions; and the number of public answers.

The dash board should also display each tenant and the number of requests they have made.

Write test as you deem them appropriate. 

## Extra Specifications

When a query parameter is provided to the questions request
then it should filter the given results.

If no results are found return an appropriate status code.

Throttle API requests on a per-Tenant basis
After the first 100 requests per day, throttle to 1 request per 10 seconds.

