# Simple URL Shortener with analytics.

Ruby version: 2.6.3  
Database: SQLite3

#### Steps to run the application in development environment:
1. Clone the repository.
2. Run 
```
    $ bundle install --path vendor/bundle
    $ rake db:create
    $ rake db:migrate
    $ rails s
```
3. Open http://localhost:3000 in browser to shorten the url.
4. Open http://localhost:3000/stats to see the analytics.

#### Trouble shooting:  
If you are getting error for the command "rake db:create", use following command:
```
    $ bundle exec rake db:create
```


