# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cousin_roman/version'

Gem::Specification.new do |spec|
  spec.name          = "cousin_roman"
  spec.version       = CousinRoman::VERSION
  spec.authors       = ["Artem Pyanykh"]
  spec.email         = ["artem.pyanykh@gmail.com"]
  spec.description   = %q{Easily convert Roman numerals to Integers. Functionality provided via String extension}
  spec.summary       = %q{Convert Roman numerals to Integers}
  spec.homepage      = "https://github.com/ArtemPyanykh/cousin_roman"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
