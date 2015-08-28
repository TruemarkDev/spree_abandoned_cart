Deface::Override.new(
    virtual_path: 'spree/admin/orders/index',
    name: 'admin_abandoned_index_button',
    insert_before: "erb[silent]:contains('if can? :edit, Spree::Order.new ')",
    text: "<li style='padding-right: 5px;'>
             <%= button_link_to Spree.t(:abandoned_index), admin_abandoned_orders_path, icon: 'ok', id: 'admin_abandoned_index' %>
           </li>"
)
