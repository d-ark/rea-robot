# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rea/robot/version'

Gem::Specification.new do |spec|
  spec.name          = "rea-robot"
  spec.version       = Rea::Robot::VERSION
  spec.authors       = ["Anton Priadko"]
  spec.email         = ["antonpriadko@gmail.com"]

  spec.summary       = %q{Toy Robot Simulator}
  spec.description   = %q{The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.}
  spec.homepage      = "https://github.com/d-ark/rea-robot"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
