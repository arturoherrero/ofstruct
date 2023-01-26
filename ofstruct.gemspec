# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.platform = Gem::Platform::RUBY
  spec.name        = "ofstruct"
  spec.version     = "0.3.0"
  spec.summary     = "OpenFastStruct"
  spec.description = "OpenFastStruct is a data structure, similar to an OpenStruct but faster."
  spec.author      = "Arturo Herrero"
  spec.email       = "arturo.herrero@gmail.com"
  spec.homepage    = "https://github.com/arturoherrero/ofstruct"
  spec.license     = "MIT"
  spec.metadata    = { "rubygems_mfa_required" => "true" }

  spec.required_ruby_version = ">= 3.0"

  spec.files         = Dir["{lib}/**/*", "LICENSE", "README.md"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "benchmark-ips", "~> 2.10"
  spec.add_development_dependency "guard-rspec", "~> 4.7"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.12"
  spec.add_development_dependency "rubocop", "~> 1.44"
  spec.add_development_dependency "rubocop-rake", "~> 0.6"
  spec.add_development_dependency "rubocop-rspec", "~> 2.18"
end
