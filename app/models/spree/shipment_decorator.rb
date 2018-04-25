Spree::Shipment.class_eval do
  
  def available_shipping_methods
    if order
      shipping_methods.select do |shipping_method|
        order.store.shipping_methods.include?(shipping_method)
      end
    else
      shipping_methods
    end
  end

end