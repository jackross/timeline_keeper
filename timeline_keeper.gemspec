$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "timeline_keeper/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "timeline_keeper"
  s.version     = TimelineKeeper::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of TimelineKeeper."
  s.description = "TODO: Description of TimelineKeeper."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.7"
  s.add_dependency "jquery-rails"
  s.add_dependency 'activeadmin'
  s.add_dependency 'meta_search', '>= 1.1.0.pre'
  s.add_dependency 'tire'
  s.add_dependency 'bootstrap-sass'
  s.add_dependency 'sass-rails'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'test-unit'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'thin'
end
