Spree::Taxonomy.class_eval do
  belongs_to :store
  has_many :store_taxonomies
  has_many :stores, through: :store_taxonomies

  scope :by_store, -> (store) { where(store_id: store) }
end
