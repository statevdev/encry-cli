# frozen_string_literal: true

require_relative "lib/encry/version"

Gem::Specification.new do |spec|
  spec.name = "encry"
  spec.version = Encry::VERSION
  spec.authors = ["statevdev"]
  spec.email = ["statev.dev@gmail.com"]

  spec.summary = "Deterministic password generator"
  spec.description = "CLI tool to derive deterministic passwords using a master key and site keyword"
  spec.homepage = "https://github.com/statevdev/encry-cli"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/statevdev/encry-cli"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = Dir["lib/**/*", "bin/*"]
  spec.bindir = "bin"
  spec.executables = ["encry"]
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "clipboard"
  spec.add_dependency "base64"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
