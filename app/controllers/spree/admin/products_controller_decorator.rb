Spree::Admin::ProductsController.class_eval do
  update.before :set_stores
  before_action :find_stores, only: [:update]

  private

  def set_stores
    return true if params["product"][:stores] == ""
    @product.stores = Spree::Store.where(id: params["product"][:stores])
    params[:product].delete(:stores)
  end
    # @product.store_ids = nil unless params[:product].key? :store_ids # => from fork/master
  end
  
  def find_stores
    store_ids = params[:product][:store_ids]
    if store_ids.present?
      params[:product][:store_ids] = store_ids.split(',')
    end
  end

end
