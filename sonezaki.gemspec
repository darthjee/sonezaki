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
  gem.test_files            = gem.files.grep(%r{^(test|gem|features)/})
  gem.require_paths         = ['lib']

  gem.add_development_dependency 'bundler',            '>= 2.5.11'
  gem.add_development_dependency 'pry',                '0.14.2'
  gem.add_development_dependency 'pry-nav',            '1.0.0'
  gem.add_development_dependency 'rake',               '13.1.0'
  gem.add_development_dependency 'redis',              '5.2.0'
  gem.add_development_dependency 'reek',               '6.1.4'
  gem.add_development_dependency 'rspec',              '3.12.0'
  gem.add_development_dependency 'rspec-core',         '3.12.2'
  gem.add_development_dependency 'rspec-expectations', '3.12.3'
  gem.add_development_dependency 'rspec-mocks',        '3.12.5'
  gem.add_development_dependency 'rspec-support',      '3.12.0'
  gem.add_development_dependency 'rubocop',            '1.59.0'
  gem.add_development_dependency 'rubocop-rspec',      '2.29.2'
  gem.add_development_dependency 'rubycritic',         '4.9.1'
  gem.add_development_dependency 'simplecov',          '0.22.0'
  gem.add_development_dependency 'yard',               '0.9.36'
  gem.add_development_dependency 'yardstick',          '0.9.9'
end
