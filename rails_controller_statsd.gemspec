# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_controller_statsd/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_controller_statsd"
  spec.version       = RailsControllerStatsd::VERSION
  spec.authors       = ["Carlos Saura"]
  spec.email         = ["saurastar@gmail.com"]
  spec.summary       = %q{Tool to monitor the usage of rails controllers}
  spec.description   = %q{Tool to monitor the usage of rails controllers}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
