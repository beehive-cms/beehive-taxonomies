Beehive::Engine.add_routes do
  namespace :admin, path: Beehive.admin_path do
    namespace :settings do
      resources :taxonomies
    end
  end
end