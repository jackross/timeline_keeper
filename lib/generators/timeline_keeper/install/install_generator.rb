module TimelineKeeper
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc <<DESC
Description:
    Copy timeline_keeper files to your application.
DESC

      def self.source_root
        @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      end

      def copy_initializer
        template 'active_admin.rb', 'config/initializers/active_admin.rb'
      end

      # Apply these in the reverse order you want them to show up in the file. The route method
      # places the new route at the top of the file.
      def setup_routes
        route 'root :to => "TimelineKeeper::Timelines#index"'
        route 'mount TimelineKeeper::Engine => "/timeline_keeper"'
        route 'devise_for :admin_users, :class_name => "TimelineKeeper::AdminUser"'
        route 'ActiveAdmin.routes(self)'
      end

      def inject_css
        application_css_scss = "app/assets/stylesheets/application.css.scss"
        application_css = "app/assets/stylesheets/application.css"
        css_file = File.exist?(application_css_scss) ? application_css_scss : application_css
        
        inject_into_file css_file, :before => " *= require_self" do
          " *= require timeline_keeper/application\n"
        end
      end

      def inject_js
        inject_into_file "app/assets/javascripts/application.js", :after => "//= require_tree ." do
          "\n//= require timeline_keeper/application\n"
        end
      end

      def copy_migrations
        rake("timeline_keeper:install:migrations")
      end

      def copy_helper
        template 'timeline_keeper_helper.rb', 'app/helpers/timeline_keeper_helper.rb'
      end
      
    end
  end
end