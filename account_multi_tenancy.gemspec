$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "account_multi_tenancy/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "account_multi_tenancy"
  s.version     = AccountMultiTenancy::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of AccountMultiTenancy."
  s.description = "TODO: Description of AccountMultiTenancy."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.4"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "3.0.1"
  s.add_development_dependency "capybara", "2.3.0"
  s.add_development_dependency "bcrypt", "3.1.7"
  s.add_dependency "warden", "1.2.3"
  s.add_dependency "dynamic_form", "1.1.4"
end
