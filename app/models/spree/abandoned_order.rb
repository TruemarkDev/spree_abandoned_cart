class Spree::AbandonedOrder < ActiveRecord::Base
  belongs_to :order, class_name: 'Spree::Order', foreign_key: :spree_order_id

  after_create :increment_send_emails_count

  def self.email_eligible_abandoned_email_orders(email_number=1)
    eligible_orders_next_attempt(email_number).each { |abandoned_order| abandoned_order.process_abandoned_email(email_number) }
  end

  def self.eligible_orders_next_attempt(emails_count = 1, hours_period = [25, 23])
    hours_period = [3, 1] unless ENV['RAILS_ENV'] == 'production'

    where(send_emails_count: emails_count,
          order_accomplished: false,
          updated_at: (Time.zone.now - hours_period[0].hours)..(Time.zone.now - hours_period[1].hours))
  end

  def process_abandoned_email(email_number=1)
    (delete && return) unless self.order.email.present?

    Spree::AbandonedCartMailer.send("abandoned_#{email_number == 1 ? 'second' : 'third'}_email", self.order).deliver
    increment_send_emails_count
  end

  private

  def increment_send_emails_count
    increment!(:send_emails_count)
  end
end
