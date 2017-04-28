Spree::Admin::ProductsController.class_eval do
  update.before :set_stores

  private

  def set_stores
    return true if params["product"][:stores] == ""
    @product.stores = Spree::Store.where(id: params["product"][:stores])
    params[:product].delete(:stores)
  end
end
