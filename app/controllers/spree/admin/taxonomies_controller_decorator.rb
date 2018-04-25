Spree::Admin::TaxonomiesController.class_eval do
  update.before :set_stores

  private

  def set_stores
    return true if params["taxonomy"][:stores] == ""
    @taxonomy.stores = Spree::Store.where(id: params["taxonomy"][:stores])
    params[:taxonomy].delete(:stores)
  end
end