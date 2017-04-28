Spree::Admin::ShippingMethodsController.class_eval do
  update.before :set_stores

  private

  def set_stores
    return true if params["shipping_method"][:stores] == ""
    @shipping_method.stores = Spree::Store.where(id: params["shipping_method"][:stores])
    params[:shipping_method].delete(:stores)
  end
end