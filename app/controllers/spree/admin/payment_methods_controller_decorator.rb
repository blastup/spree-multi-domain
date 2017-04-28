Spree::Admin::PaymentMethodsController.class_eval do
  update.before :set_stores

  private

  def set_stores
    return true if params["payment_method"][:stores] == ""
    @payment_method.stores = Spree::Store.where(id: params["payment_method"][:stores])
    params[:payment_method].delete(:stores)
  end
end