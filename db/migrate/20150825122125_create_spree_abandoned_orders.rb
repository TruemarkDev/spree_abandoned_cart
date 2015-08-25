class CreateSpreeAbandonedOrders < ActiveRecord::Migration
  def change
    create_table :spree_abandoned_orders do |t|
      t.belongs_to :spree_order
      t.integer    :send_emails_count,  default: 0,     null: false
      t.boolean    :order_accomplished, default: false, null: false
      t.datetime   :accomplished_at,    default: nil

      t.timestamps
    end

    add_index       :spree_abandoned_orders, :spree_order_id
  end
end
