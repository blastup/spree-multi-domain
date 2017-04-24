Spree::Admin::TaxonomiesController.class_eval do
  before_action :set_stores, only: [:create, :update]

  private

  def set_stores
    return true if params["taxonomy"][:stores] == ""
    @taxonomy.stores = Spree::Store.where(id: params["taxonomy"][:stores])
    params[:taxonomy].delete(:stores)
  end
end