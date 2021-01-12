# Rails Template

A foundational rails project template for use in jump starting new projects.

## Prerequisites

#### System
- [Foreman](https://github.com/ddollar/foreman)
- Node 13.5.0
- PostgreSQL 11
- Rails 6.0.2.1
- Ruby 2.6.5
- Yarn 1.21.1

#### Services
- [CircleCI Project](https://circleci.com/)
- [Heroku Project](https://heroku.com)

#### Application Files
- `.env.development`
- `.env.test`
- `config/master.key`

#### Recommendations
- [nvm](https://formulae.brew.sh/formula/nvm)
- [Postgres App](https://postgresapp.com/)
- [rbenv](https://github.com/rbenv/rbenv)


## Getting Started

#### Install Ruby Libraries
```
bundle install
```

#### Install JavaScript Libraries
```
yarn install
```

#### Initialize Database
```
rails db:create db:migrate
```

#### Seed Database (Optional)
```
rails db:seed
```


## Starting the Servers

This will start both the Rails and Webpack dev servers

```
foreman start
```

## Testing

#### Running Tests Locally
```
bundle exec rspec
```

#### View Test Coverage
After running the test suite locally.  
```
open coverage/index.html
```

#### QA Server

```
git remote add staging https://git.heroku.com/<heroku-project-name>.git
```  
(First time only)

```
heroku open --remote staging
```

OR

Go to: [https://<heroku-project-name>.herokuapp.com](https://<heroku-project-name>.herokuapp.com)

#### Preview Emails
- Start local server  
- Go to: [http://localhost:3000/rails/mailers](http://localhost:3000/rails/mailers)
