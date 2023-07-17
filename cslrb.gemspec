# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cslrb/version'

Gem::Specification.new do |spec|
  spec.name          = 'cslrb'
  spec.version       = Cslrb::VERSION
  spec.authors       = ['Sascha Knobloch']
  spec.email         = ['saschaknobloch.dev@gmail.com']

  spec.summary       = 'Cslrb uses the Rust library Cardano Serialization Lib to make some of its features available in Ruby.'
  spec.description   = 'This gem provides a Ruby interface to the Cardano Serialization Lib by leveraging Rutie, allowing developers to work with Cardano-specific data structures in their Ruby applications.'
  spec.homepage      = 'https://github.com/saschaknobloch/cslrb'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }

  spec.extensions = ['ext/Rakefile']
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rutie', '~> 0.0.4'
  spec.add_runtime_dependency 'thermite', '~> 0.13'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.6'
  spec.add_development_dependency 'rubocop', '~> 1.54'
  spec.add_development_dependency 'json', '~> 2.6'
end
