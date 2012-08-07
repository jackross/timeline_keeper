# add timeline_keeper to Gemfile

`gem 'timeline_keeper', :git => 'git://github.com/jronallo/timeline_keeper.git'`

bundle install

# install migrations

```
bundle exec rake timeline_keeper:install:migrations
bundle exec rake db:migrate
```

# ActiveAdmin setup in host application

Add the following to `config/initializers/active_admin.rb`:

```
ActiveAdmin.setup do |config|
  config.load_paths.delete_at(0)
  config.load_paths << "#{TimelineKeeper::Engine.root}/app/admin/"
  config.site_title = "Timeline Keeper"
  config.authentication_method = :authenticate_admin_user!
  config.current_user_method = :current_admin_user
  config.logout_link_path = :destroy_admin_user_session_path  
end

```

Some ActiveAdmin setup you must do manually if you haven't yet:

  1. Ensure you have defined default url options in your environments files. Here 
     is an example of default_url_options appropriate for a development environment 
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { :host => 'localhost:3000' }

     In production, :host should be set to the actual host of your application.

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root :to => "home#index"


# routes

Add the following to your routes:

```
  ActiveAdmin.routes(self)
  devise_for :admin_users, :class_name => "TimelineKeeper::AdminUser"
  mount TimelineKeeper::Engine => "/timeline_keeper"
  root :to => 'TimelineKeeper::Timelines#index'
```


# assets
1. change application.css to application.css.scss and add:
   `@import "timeline_keeper/application";`  
   or include the following in application.css:
   `*= require timeline_keeper/application`
2. add this to application.js:
   `//= require timeline_keeper/application`

# Add helper for linking to external media

Add the following to `app/helpers/timeline_keeper_helper.rb`:

```
module TimelineKeeperHelper

  def url_for_external_media(event)
    "http://d.lib.ncsu.edu/collections/catalog/#{event.media_filename}"
  end

end
```

# ElasticSearch

Install and start elasticsearch so that event indexing and searching works. Any event you add to your persistent database ought to be added to the elasticsearch index through a callback.

If you already have events in your database and need to import everything in the search index again, you can run the following:

`bundle exec rake environment tire:import CLASS='TimelineKeeper::Event'`
