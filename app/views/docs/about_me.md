# About Me

My name is Sean Ferney, im a ruby on rails programer and this completed assessment is my work.

## The original assessment

I spending some time preparing to use the original assessment. I matched ruby and bundler and rails versions and fixing broken dependencies, I also experimented with updating rails. I decided it would be more effective to start from a new clean project and meet the assessment specifications with that instead. It is a 6 year old project that is more or less a empty rails app.

Working with older versions of rails takes more debugging time. Thats fine on the clock, but on my own time I would rather use an up-to-date version of rails.

That also gave me a chance use my preferred setup, with tools like rspec and factory bot. It also avoids issues with changes to gems affecting documentation.

## Doing the assessment

I tend to be a TDD oriented programer. I wrote most of the project using tests before I booted the rails server. Making requests with postman has always felt inconvenient to me. When I am writing an API I prefer to use request specs fist.

I have worked with Oauth user authentication before but this was my first time implementing token api_key based authentication. I think it provides a suitable level of security for a read-only api. However I would want to read more about the security of the approach before using it for writeable api requests or any apis dealing with potentially sensitive data.

While it seemed unneeded for the assessment, In production I would associate api_keys/tenants with specific users.

Before I add pagination to the questions index, I decided it would be a good idea to follow a proper API specification. I settled on RESTful HAL specification for its simplicity.




## Links

You can find this project on github at [opsaaaaa/interview-q-and-a-api-demo](https://github.com/opsaaaaa/interview-q-and-a-api-demo).
You can email me with [sean@ferney.org](mailto: sean@ferney.org)
