Spree::Api::V1::OrdersController.class_eval do
  def index
    authorize! :index, Order
    @orders = Order.ransack(params[:q]).result.page(params[:page]).per(params[:per_page]).where(:store_id => current_store.id)
    respond_with(@orders)
  end

  def mine
    if current_api_user.persisted?
      @orders = current_api_user.orders.where(:store_id => current_store.id).reverse_chronological.ransack(params[:q]).result.page(params[:page]).per(params[:per_page])
    else
      render "spree/api/errors/unauthorized", status: :unauthorized
    end
  end

  private
    def find_current_order
      current_api_user ? current_api_user.orders.where(:store_id => current_store.id).incomplete.order(:created_at).last : nil
    end
end