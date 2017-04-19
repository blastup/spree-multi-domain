Deface::Override.new(
  virtual_path: "spree/admin/pages/index",
  name: "multi_domain_admin_pages_index_headers",
  insert_before: "[data-hook='admin_pages_index_header_actions']",
  text: '<th class="text-center"><%= Spree.t(:stores) %></th>',
  disabled: false)

Deface::Override.new(
  virtual_path: "spree/admin/pages/index",
  name: "multi_domain_admin_pages_index_rows",
  insert_before: "[data-hook='admin_pages_index_row_actions']",
  text: '<td class="text-center"><%= page.stores.map(&:code).join(", ") unless page.stores.empty? %></td>',
  disabled: false)