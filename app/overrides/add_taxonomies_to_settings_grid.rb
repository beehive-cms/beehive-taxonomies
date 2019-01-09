Deface::Override.new(
  virtual_path: 'beehive/admin/settings/show',
  name: 'add_taxonomies_to_admin_settings_grid_menu',
  insert_bottom: ".bh-nav-grid",
  original: 'c4c73ea2be1d0c2c10fa84b207449033a5803f38',
  text: %(
    <%= render 'beehive/shared/nav_grid_item', path: admin_settings_taxonomies_path,
                                               title: 'Taxonomies',
                                               text_icon: 't',
                                               text: 'Taxonomies and taxons' %>
  )
)