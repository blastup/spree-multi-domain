Spree::Search::MySearchkick.class_eval do
  
  def get_base_scope
    base_scope = @cached_product_group ? @cached_product_group.products.active : Spree::Product.active
    base_scope = base_scope.by_store(current_store_id) if current_store_id
    base_scope = base_scope.in_taxon(taxon) unless taxon.blank?

    base_scope = get_products_conditions_for(base_scope, keywords) unless keywords.blank?

    base_scope = add_search_scopes(base_scope)
    base_scope
  end

  def prepare(params)
    super
    @properties[:current_store_id] = params[:current_store_id]
    @properties[:price_from] = params[:price_from]
    @properties[:price_to] = params[:price_to]
  end

end