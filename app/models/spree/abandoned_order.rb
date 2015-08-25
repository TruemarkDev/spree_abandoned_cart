class Spree::AbandonedOrder < ActiveRecord::Base
  belongs_to :order, class_name: 'Spree::Order', foreign_key: :spree_order_id

  after_create :increment_send_emails_count

  private

  def increment_send_emails_count
    increment!(:send_emails_count)
  end
end
