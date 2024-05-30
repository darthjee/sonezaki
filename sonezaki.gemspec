# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sonezaki/version'

Gem::Specification.new do |gem|
  gem.name                  = 'sonezaki'
  gem.version               = Sonezaki::VERSION
  gem.authors               = ['DarthJee']
  gem.email                 = ['darthjee@gmail.com']
  gem.homepage              = 'https://github.com/darthjee/sonezaki'
  gem.description           = ''
  gem.summary               = gem.description
  gem.required_ruby_version = '>= 3.3.0'

  gem.files                 = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.executables           = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.require_paths         = ['lib']

  gem.metadata['rubygems_mfa_required'] = 'true'
end
