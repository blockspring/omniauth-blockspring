# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-blockspring/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Blockspring"]
  gem.email         = ["jason@blockspring.com"]
  gem.description   = %q{Official OmniAuth strategy for Blockspring.}
  gem.summary       = %q{Official OmniAuth strategy for Blockspring.}
  gem.homepage      = "https://github.com/blockspring/omniauth-blockspring"
  gem.license       = "MIT"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-blockspring"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Blockspring::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  # Nothing lower than omniauth-oauth2 1.1.1
  # http://www.rubysec.com/advisories/CVE-2012-6134/
  gem.add_dependency 'omniauth-oauth2', '>= 1.1.1', '< 2.0'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
