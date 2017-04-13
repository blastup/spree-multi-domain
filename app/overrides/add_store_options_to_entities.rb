Deface::Override.new(
  virtual_path: 'spree/admin/shipping_methods/edit',
  name: 'store_options_shipping_method',
  insert_before: '[data-hook="admin_shipping_method_edit_form_buttons"]',
  partial: 'spree/admin/shipping_methods/store_options',
  disabled: false
)

Deface::Override.new(
  virtual_path: 'spree/admin/payment_methods/_form',
  name: 'store_options_payment_method',
  insert_after: '[data-hook="admin_payment_method_form_fields"]',
  partial: 'spree/admin/payment_methods/store_options',
  disabled: false
)

Deface::Override.new(
  virtual_path: 'spree/admin/taxonomies/_form',
  name: 'store_options_taxonomy',
  insert_bottom: '[data-hook="admin_inside_taxonomy_form"]',
  partial: 'spree/admin/taxonomies/store_options',
  disabled: false
)