class CreateBeehiveTaxons < ActiveRecord::Migration[5.2]
  def change
    create_table :beehive_taxons do |t|
      t.string :name
      t.text :description
      t.references :taxonomy, foreign_key: true
      t.integer :taxonables_count, default: 0

      t.timestamps
    end
  end
end
