# About Me

My name is Sean Ferney. Im a ruby on rails programer and this completed assessment is my work.

## Links

You can find this project on github at [opsaaaaa/interview-q-and-a-api-demo](https://github.com/opsaaaaa/interview-q-and-a-api-demo).
You can email me with [sean@ferney.org](mailto: sean@ferney.org)

You can find the pull request to review this code assessment here [interview-q-and-a-api-demo/pull/1/files](https://github.com/opsaaaaa/interview-q-and-a-api-demo/pull/1/files).

## Why use a new project?

I spent some time preparing to use the original assessment. I matched ruby, bundler, and rails versions. I fixed some broken dependencies. I also experimented with updating rails. I decided it would be more effective to start from a new clean project and meet the assessment specifications with that instead. It is a 6 year old project that is more or less an empty rails app.

Working with older versions of rails takes more debugging time. Thats fine on the clock, but on my own time I would rather use an up-to-date version of rails.

That also gave me a chance use my preferred setup, with tools like rspec and factory bot. It also avoids issues with changes to gems affecting documentation.

## Doing the assessment

I tend to be a TDD oriented programer. I wrote most of the project using tests before I booted the rails server. Making requests with postman has always felt inconvenient to me. When I am writing an API I prefer to use request specs fist.

I have worked with Oauth user authentication before but this was my first time implementing token api_key based authentication. I think it provides a suitable level of security for a read-only api. However I would want to read more about the security of the approach before using it for writeable api requests or any apis dealing with potentially sensitive data.

While it seemed unneeded for the assessment, In production I would associate api_keys/tenants with specific users.

Before I added pagination, I decided it would be a good idea to follow a proper API specification. I settled on RESTful HAL specification for its simplicity.

In a production app I would use elasticsearch or something similar. That would have the efficiency from using a search index and the ability to sort results by relevance. However for the fun of it, I wanted to try searching searching `questions.title`'s and `answer.body`'s with joins tables.
I decided to create a separate endpoint for searching questions, instead of supporting a query on the questions index. 

I decided not to implement the request throttling feature. 
If I did I would create a new table for `requests per day` or perhaps a generalized `requests per time period`. 

> When a tenant makes an api request 
> 
> it would find or create the associated `requests per day` record for that day 
> 
> and then increment it.
>
> The record would have a `time_out` timestamp field.
>
> For every request made over the 100 request threshold the `time_out` would be updated to the current time.
>
> If the current `requests per day` record exceeded the threshold 
>
> and the `time_out` happened less than 10 seconds ago, 
>
> then the request would be refused 
>
> and an appropriate status code would be returned.

I am thinking it would probably be faster to use a session for that instead of a database record, but the general idea would still apply.


