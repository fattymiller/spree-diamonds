# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_diamonds'
  s.version     = '0.5.0'
  s.summary     = 'diamonds-for-you spree extension'
  s.description = 'Spreecommerce extension to get this working for diamonds-for-you'
  s.required_ruby_version = '>= 1.9.2'

  s.author    = 'fattymiller'
  s.email     = 'github-diamonds@syn-ng.com'
  s.homepage  = 'http://www.diamonds-for-you.com.au'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 1.2.0'

  s.add_development_dependency 'capybara', '1.0.1'
  s.add_development_dependency 'factory_girl', '~> 2.6.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.9'
  s.add_development_dependency 'sqlite3'
end
