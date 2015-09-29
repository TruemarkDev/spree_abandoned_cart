# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_abandoned_cart'
  s.version     = '0.0.1'
  s.summary     = 'Abandoned cart email'
  s.description = 'Abandoned cart email'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Jet Ruby Agency'
  s.email     = 'info@jetruby.com'
  s.homepage  = 'http://jetruby.com/'

  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.4.3'

  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
