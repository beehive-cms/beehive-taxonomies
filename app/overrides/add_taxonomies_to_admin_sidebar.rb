Deface::Override.new(
  virtual_path: 'beehive/shared/_sidebar',
  name: 'add_taxonomies_to_admin_settings_sidebar_menu',
  insert_after: "erb[loud]:contains('admin_users_path')",
  original: '3d62dce36a1ec191df5d22d9e89239419ca06627',
  text: "<%= sidebar_nav_item 'Taxonomies', admin_settings_taxonomies_path, text_icon: 't' %>"
)