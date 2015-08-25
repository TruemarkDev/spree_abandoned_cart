Spree::OrderUpdater.class_eval do

  def update_payment_state
    last_state = order.payment_state

    if payments.present? && payments.valid.size == 0
      order.payment_state = 'failed'
    elsif order.state == 'canceled' && order.payment_total == 0
      order.payment_state = 'void'
    else
      order.payment_state = 'balance_due' if order.outstanding_balance > 0
      order.payment_state = 'credit_owed' if order.outstanding_balance < 0

      if !order.outstanding_balance?
        order.payment_state = 'paid'
        # Update abandoned order after changing order status to 'paid'
        if order.abandoned_order.present?
          order.abandoned_order.update(order_accomplished: true, accomplished_at: Time.zone.now)
        end
      end
    end
    order.state_changed('payment') if last_state != order.payment_state
    order.payment_state
  end
end
