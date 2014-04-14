# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'manicure/version'

Gem::Specification.new do |spec|
  spec.name          = "manicure"
  spec.version       = Manicure::VERSION
  spec.authors       = ["Yannick Rekinger"]
  spec.email         = ["yrekinger@gmail.com"]
  spec.description   = %q{
    Currently under development
  }
  spec.summary       = %q{
    Summary
  }
  spec.homepage      = "https://github.com/Infotaku/manicure"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
