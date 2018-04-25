class AddStoreToTaxonomy < ActiveRecord::Migration
  def change
    create_table :spree_store_taxonomies do |t|
      t.integer :store_id
      t.integer :taxonomy_id

      t.timestamps null: false
    end
  end
end
