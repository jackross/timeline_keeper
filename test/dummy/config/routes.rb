Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :admin_users, :class_name => "TimelineKeeper::AdminUser"
  mount TimelineKeeper::Engine => "/timeline_keeper"
  root :to => 'TimelineKeeper::Timelines#index'
end
