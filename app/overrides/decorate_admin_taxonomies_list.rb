Deface::Override.new(
  virtual_path: "spree/admin/taxonomies/_list",
  name: "multi_domain_admin_taxonomies_list_head",
  insert_before: "th.actions",
  text: "<th><%= Spree.t(:stores) %></th>",
  disabled: false)


Deface::Override.new(
  virtual_path: "spree/admin/taxonomies/_list",
  name: "multi_domain_admin_taxonomies_list_body",
  insert_before: "td.actions",
  text: "<td><%= taxonomy.stores.map(&:code).join(', ') unless taxonomy.stores.empty? %></td>",
  disabled: false)
