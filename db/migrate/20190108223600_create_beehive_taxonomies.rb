class CreateBeehiveTaxonomies < ActiveRecord::Migration[5.2]
  def change
    create_table :beehive_taxonomies do |t|
      t.string :name
      t.text :description
      t.integer :taxons_count, default: 0

      t.timestamps
    end
  end
end
