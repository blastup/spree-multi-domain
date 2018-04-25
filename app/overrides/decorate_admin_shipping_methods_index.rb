Deface::Override.new(
  virtual_path: "spree/admin/shipping_methods/index",
  name: "multi_domain_admin_shipping_methods_index_headers",
  insert_before: "[data-hook='admin_shipping_methods_index_header_actions']",
  text: '<th class="text-center"><%= Spree.t(:stores) %></th>',
  disabled: false)

Deface::Override.new(
  virtual_path: "spree/admin/shipping_methods/index",
  name: "multi_domain_admin_shipping_methods_index_rows",
  insert_before: "[data-hook='admin_shipping_methods_index_row_actions']",
  text: '<td class="text-center"><%= shipping_method.stores.map(&:code).join(", ") unless shipping_method.stores.empty? %></td>',
  disabled: false)