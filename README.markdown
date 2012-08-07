# TimelineKeeper

timeline_keeper is a gem which packages ActiveAdmin, Timeline JS, and Twitter Bootstrap as a Rails engine for managing and displaying interactive timelines.

# Install

Add timekeeper_timeline to a Gemfile for a fresh Rails project and bundle install:

```
gem 'timeline_keeper', :git => 'git://github.com/jronallo/timeline_keeper.git'
bundle
```

Run the install generator:

`rails g timeline_keeper:install`

Run the migrations:

`rake db:migrate`

Then: 

- Remove public/index.html
- Start Rails
- Visit the admin interface at http://localhost:3000/admin
- Enter the username/password of admin@example.com/password
- Add Timelines
- Add Events and add them to Timelines
- Visit http://localhost:3000

# Thanks

Thanks go to these projects which are included:
- [Timeline JS](http://timeline.verite.co/)
- [ActiveAdmin](http://activeadmin.info/)
- [Twitter Bootstrap](http://twitter.github.com/bootstrap/)

# Author

Jason Ronallo

# License

See MIT-LICENSE


