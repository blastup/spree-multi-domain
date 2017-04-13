Spree::Admin::ShippingMethodsController.class_eval do
  before_action :set_stores, only: [:create, :update]

  private

  def set_stores
    return true if params["shipping_method"][:stores] == ""
    @shipping_method.stores = Spree::Store.where(id: params["shipping_method"][:stores])
    @shipping_method.save
    params[:shipping_method].delete(:stores)
  end
end