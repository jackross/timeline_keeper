$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "timeline_keeper/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "timeline_keeper"
  s.version     = TimelineKeeper::VERSION
  s.authors     = ["Jason Ronallo"]
  s.email       = ["jronallo@gmail.com"]
  s.homepage    = "https://github.com/jronallo/timeline_keeper"
  s.summary     = "timeline_keeper is a Rails engine for managing and displaying timelines."
  s.description = "timeline_keeper packages ActiveAdmin, Timeline JS, and Twitter Bootstrap as a Rails engine for managing and displaying interactive timelines."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.markdown"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.7"
  s.add_dependency "jquery-rails"
  s.add_dependency 'activeadmin'
  s.add_dependency 'meta_search'
  s.add_dependency 'tire'
  s.add_dependency 'bootstrap-sass'
  s.add_dependency 'sass-rails'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'test-unit'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'thin'
end
