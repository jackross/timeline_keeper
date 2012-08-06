TimelineKeeper::Engine.routes.draw do
  get "events" => 'events#index', :as => :events

  get "events/:id" => 'events#show', :as => :event

  get "timelines" => 'timelines#index', :as => :timelines

  get "timelines/:id" => 'timelines#show', :as => :timeline

  ActiveAdmin.routes(self)

  devise_for :admin_users, :class_name => "TimelineKeeper::AdminUser"

end
