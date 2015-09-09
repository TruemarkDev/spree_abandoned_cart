class Spree::AbandonedCartEmailConfiguration < Spree::Preferences::Configuration
  preference :email_timeframe_from, :integer
  preference :email_timeframe_to,   :integer
  preference :email_from,           :string
end
