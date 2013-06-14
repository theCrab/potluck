# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'taxi/version'

Gem::Specification.new do |gem|
  gem.name          = "taxi_spec"
  gem.version       = Taxi::VERSION
  gem.authors       = ["Nelson Kelem"]
  gem.email         = ["nelson@21waves.com"]
  gem.description   = %q{This is the business logic for the app. It's framework independent. I this lib we implement the full meat of the business. It's my hope we will never rely on a framework for this part. }
  gem.summary       = %q{The business framework agnostic logic for the taxi app.}
  gem.homepage      = "http://taxipiper.com"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.requirements << 'none'

  gem.required_ruby_version = '>= 1.9.3'

  # gem.add_dependency 'inflecto', '~> 0.0.2'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rake'

end
