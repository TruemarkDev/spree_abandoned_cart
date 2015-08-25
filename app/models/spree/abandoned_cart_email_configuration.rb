class Spree::AbandonedCartEmailConfiguration < Spree::Preferences::Configuration
  preference :email_timeframe_from, :integer, default: 24.hours
  preference :email_timeframe_to,   :integer, default: 6.hours
  preference :email_from,           :string,  default: 'spree@example.com'
end
