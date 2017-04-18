# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/xcode_build_settings/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-xcode_build_settings'
  spec.version       = Fastlane::XcodeBuildSettings::VERSION
  spec.author        = %q{teriiehina}
  spec.email         = %q{peter@teriiehina.pf}

  spec.summary       = %q{Get the value of a build setting given the configuration and/or the build action}
  spec.homepage      = "https://github.com/<GITHUB_USERNAME>/fastlane-plugin-xcode_build_settings"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # spec.add_dependency 'your-dependency', '~> 1.0.0'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'fastlane', '>= 1.92.0.beta2'
end
