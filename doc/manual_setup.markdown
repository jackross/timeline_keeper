# ActiveAdmin setup in host application

Some setup you must do manually if you haven't yet:

  1. Ensure you have defined default url options in your environments files. Here 
     is an example of default_url_options appropriate for a development environment 
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { :host => 'localhost:3000' }

     In production, :host should be set to the actual host of your application.

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root :to => "home#index"

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

# assets
1. change application.css to application.css.scss and add:
   `@import "timeline_keeper/application";`  
2. add this to application.js:
   `//= require timeline_keeper/application`

# Add helper for linking to external media

```
module TimelineKeeperHelper

  def url_for_external_media(event)
    "http://d.lib.ncsu.edu/collections/catalog/#{event.media_filename}"
  end

end
```
