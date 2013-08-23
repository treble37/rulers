# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rulers/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["BruceP"]
  gem.email         = ["brucepark0@gmail.com"]
  gem.description   = %q{Rulers gem}
  gem.summary       = %q{Rulers gem}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rulers"
  gem.require_paths = ["lib"]
  gem.version       = Rulers::VERSION

  gem.add_runtime_dependency "rack"
  gem.add_development_dependency "rack-test"
end
