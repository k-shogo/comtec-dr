# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "comtec-dr/version"

Gem::Specification.new do |spec|
  spec.name          = "comtec-dr"
  spec.version       = ComtecDR::VERSION
  spec.authors       = ["Shogo Kawaguchi"]
  spec.email         = ["platycod0n.ramosa@gmail.com"]

  spec.summary       = %q{comtec drive recorder analyzer}
  spec.description   = %q{comtec drive recorder analyzer}
  spec.homepage      = "https://github.com/k-shogo/comtec-dr"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
