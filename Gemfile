# frozen_string_literal: true

source %(https://rubygems.org)

def local_gem(gem_name)
  local_path = %(./aux/gems/#{gem_name})
  if Dir.exist?(local_path)
    gem gem_name, path: local_path
  else
    gem gem_name
  end
end

group :development do
  %w[
    rake
    solargraph
  ].each do |pkg|
    gem pkg
  end
end

group :production do
  local_gem %(abstract-synthesizer)
  gem %(yggdrasil), path: %(./src)
end
