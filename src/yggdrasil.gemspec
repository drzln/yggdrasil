# frozen_string_literal: true

lib = File.expand_path(%(lib), __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative %(lib/yggdrasil/version)

Gem::Specification.new do |spec|
  spec.name                  = %(yggdrasil)
  spec.version               = Yggdrasil::VERSION
  spec.authors               = [%(drzthslnt@gmail.com)]
  spec.email                 = [%(drzthslnt@gmail.com)]
  spec.description           = %(control nix flakes repositories with ruby)
  spec.summary               = %(control nix flakes repositories with ruby)
  spec.homepage              = %(https://github.com/drzln/#{spec.name})
  spec.license               = %(MIT)
  spec.require_paths         = [%(lib)]
  spec.required_ruby_version = %(>= #{`cat .ruby-version`})

  spec.executables << %(yggdrasil)

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  %i[
    rubocop-rspec
    rubocop-rake
    solargraph
    keycutter
    rubocop
    rspec
    rake
    yard
  ].each do |gem|
    spec.add_development_dependency(gem)
  end

  %i[
    terraform-synthesizer
    abstract-synthesizer
    aws-sdk-dynamodb
    tty-progressbar
    aws-sdk-s3
    tty-option
    tty-table
    tty-color
    tty-box
    toml-rb
  ].each do |gem|
    spec.add_runtime_dependency(gem)
  end

  spec.metadata[%(rubygems_mfa_required)] = %(true)
end
