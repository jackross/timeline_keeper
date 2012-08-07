# TimelineKeeper

timeline_keeper is a gem which packages ActiveAdmin, Timeline JS, and Twitter Bootstrap as a Rails engine for managing and displaying interactive timelines.

# Install

1. Add timekeeper_timeline to a Gemfile for a fresh Rails project:

```
gem 'timeline_keeper', :git => 'git://github.com/jronallo/timeline_keeper.git'
bundle
```

2. Run the install generator:

`rails g timeline_keeper:install`

3. Run the migrations:

`rake db:migrate`

4. Remove public/index.html

5. Start Rails

6. Visit the admin interface at http://localhost:3000/admin
7. Enter the username/password of admin@example.com/password
8. Add Timelines
9. Add Events and add them to Timelines
10. Visit http://localhost:3000

# Author

Jason Ronallo

# License

See MIT-LICENSE


