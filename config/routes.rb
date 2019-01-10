Beehive::Engine.add_routes do
  namespace :admin, path: Beehive.admin_path do
    namespace :settings do
      resources :taxonomies do
        resources :taxons
      end
    end
  end

  namespace :api do
    namespace :v1 do
      jsonapi_resources :taxonomies
      jsonapi_resources :taxons
    end
  end
end
