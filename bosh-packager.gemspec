# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bosh/packager/version'

Gem::Specification.new do |spec|
  spec.name          = "bosh-packager"
  spec.version       = Bosh::Packager::VERSION
  spec.authors       = ["Dr Nic Williams"]
  spec.email         = ["drnicwilliams@gmail.com"]
  spec.description   = %q{Apply a bosh release to the local bosh stemcell from a target bosh director/blobstore.}
  spec.summary       = %q{Apply a bosh release to the local bosh stemcell from a target bosh director/blobstore.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "bosh_cli", "~> 1.5.0.pre"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
