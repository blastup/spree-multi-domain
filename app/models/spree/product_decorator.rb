Spree::Product.class_eval do
  has_and_belongs_to_many :stores, join_table: 'spree_products_stores', :before_add => :validates_store
  scope :by_store, -> (store) { joins(:stores).where(spree_products_stores: { store_id: store }) }

  after_create :associate_with_stores

  private
    def validates_store(store)
      raise ActiveRecord::Rollback if self.stores.include? store
    end
    def associate_with_stores
      self.stores = Spree::Store.all
    end
end
