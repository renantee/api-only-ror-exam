# API ONLY ROR EXAM

To change Ruby version https://rvm.io
```
RUBY 2.7.0
```

Using Rails Version
```
RAILS 6.1.3
```

To Change Node version https://github.com/hokaccha/nodebrew
```
NODE v14.15.3
```

Start Server
```
  rails s -p < PORT >
```

( USE THIS ) AUTO RUN BOTH  RUBOCOP / RAILS BEST PRACTICE USING GUARD
```
 bundle exec guard
```

MANUAL: Auto Correct Rubo Cup
```
 bundle exec rubocop --safe-auto-correct
```

OR MANUAL: Running Rubocop Server https://github.com/rubocop/rubocop
```
  bundle exec rubocop
```

OR MANUAL: Running Rails Best Practice https://github.com/flyerhzm/rails_best_practices
```
bundle exec rails_best_practices .
```

Run Rspec Testing https://github.com/rspec/rspec-rails

```
bundle exec rspec spec
```
---

App Required Gems
```
  - Bcrypt ( for Authentication )
  - json jbuilder ( json formater )
  - Cloudinary ( third party image storage )
  - Act as Paranoid ( for soft deletion )
  - RSPEC ( application testing )
  - factory bot ( test defination syntax )
```

Optional Gems
```
  - JWT ( for Authorization )
  - apipie-rails  ( api documentation https://github.com/Apipie/apipie-demo )
```

App Code Checker
https://github.com/rubocop/rubocop
https://github.com/flyerhzm/rails_best_practices
```
  - Rubocop ( Development Code Linter )
  - Rails Best Practice ( Community Standard Practices )
  - Rspec ( Request Testing and Code Protection )
```
