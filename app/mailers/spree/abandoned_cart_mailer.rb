module Spree
  class AbandonedCartMailer < ActionMailer::Base
    default from: Spree::AbandonedCartEmailConfig::Config.email_from

    def abandoned_email(order)
      @order = order
      mail to: @order.email, subject: Spree.t('abandoned_cart.email.subject')
    end

    def abandoned_second_email(order)
      @order = order
      mail to: @order.email, subject: Spree.t('abandoned_cart.email.subject_second'),
    end

    def abandoned_third_email(order)
      @order = order
      mail to: @order.email, subject: Spree.t('abandoned_cart.email.subject_third'),
    end
  end
end
