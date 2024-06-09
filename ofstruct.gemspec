# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.platform = Gem::Platform::RUBY
  spec.name        = "ofstruct"
  spec.version     = "0.3.2"
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
end
