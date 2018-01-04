DESCRIPTION:

The application serves as two endpoints. The first endpoint is receives a url, and stores to the 
webpage the text content in the h1, h2, h3, and links tags. The second endpoint is an index route that
displays all of the indexed urls. The application also implements model and API endpoint testing through
rspec and FactoryBot. 

AFTER CLONING THE REPOSITORY:

Run bundle install

Run rake db:migrate

RUNNING THE APPLICATION:

Post rquest. 

In order to index a url, the user makes a post request to http://localhost:3000/url_contents/ 

Params must be included and labeled url. url: "www.google.com"

If the url is invalid or does not contain content, an error message in JSON will be sent back to the user. 

Get request. 

In order to receive the indexed webpage content, a GET request is made to http://localhost:3000/url_contents 




