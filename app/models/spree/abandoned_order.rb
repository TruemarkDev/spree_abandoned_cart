class Spree::AbandonedOrder < ActiveRecord::Base
  COUNTER_THIRD_ATTEMPT = 2

  belongs_to :order, class_name: 'Spree::Order', foreign_key: :spree_order_id

  after_create :increment_send_emails_count

  def self.email_second_eligible_abandoned_email_orders
    eligible_orders_next_attempt.each { |abandoned_order| abandoned_order.send_second_abandoned_email }
  end

  def self.email_third_eligible_abandoned_email_orders
    eligible_orders_next_attempt(COUNTER_THIRD_ATTEMPT).each { |abandoned_order| abandoned_order.send_third_abandoned_email }
  end

  def self.eligible_orders_next_attempt(emails_count = 1, hours_period = [3, 1])
  # def self.eligible_orders_next_attempt(emails_count = 1, hours_period = [25, 23])
    where(send_emails_count: emails_count,
          order_accomplished: false,
          updated_at: (Time.zone.now - hours_period[0].hours)..(Time.zone.now - hours_period[1].hours))
  end

  def send_second_abandoned_email
    Spree::AbandonedCartMailer.abandoned_second_email(self.order).deliver
    increment_send_emails_count
  end

  def send_third_abandoned_email
    Spree::AbandonedCartMailer.abandoned_third_email(self.order).deliver
    increment_send_emails_count
  end

  private

  def increment_send_emails_count
    increment!(:send_emails_count)
  end
end
