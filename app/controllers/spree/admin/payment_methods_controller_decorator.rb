Spree::Admin::PaymentMethodsController.class_eval do
  before_action :set_stores, only: [:create, :update]

  private

  def set_stores
    return true if params["payment_method"][:stores] == ""
    @payment_method.stores = Spree::Store.where(id: params["payment_method"][:stores])
    @payment_method.save
    params[:payment_method].delete(:stores)
  end
end