Deface::Override.new(
  virtual_path: "spree/admin/payment_methods/index",
  name: "multi_domain_admin_payment_methods_index_headers",
  insert_before: "[data-hook='admin_payment_methods_index_header_actions']",
  text: '<th class="text-center"><%= Spree.t(:stores) %></th>',
  disabled: false)

Deface::Override.new(
  virtual_path: "spree/admin/payment_methods/index",
  name: "multi_domain_admin_payment_methods_index_rows",
  insert_before: "[data-hook='admin_payment_methods_index_row_actions']",
  text: '<td class="text-center"><%= method.stores.map(&:code).join(", ") unless method.stores.empty? %></td>',
  disabled: false)