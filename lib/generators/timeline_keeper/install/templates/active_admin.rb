ActiveAdmin.setup do |config|
  config.load_paths.delete_at(0)
  config.load_paths << "#{TimelineKeeper::Engine.root}/app/admin/"
  config.site_title = "Timeline Keeper"
  config.authentication_method = :authenticate_admin_user!
  config.current_user_method = :current_admin_user
  config.logout_link_path = :destroy_admin_user_session_path  
end