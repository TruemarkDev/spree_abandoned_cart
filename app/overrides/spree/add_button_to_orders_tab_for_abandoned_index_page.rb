Deface::Override.new(
    virtual_path: 'spree/admin/orders/index',
    name: 'admin_abandoned_index_button',
    insert_before: "erb[silent]:contains('end if can? :create, Spree::Order')",
    text: "<%= button_link_to Spree.t(:abandoned_index), admin_abandoned_orders_path, icon: 'ok', id: 'admin_abandoned_index' %>"
)
