# frozen_string_literal: true

require 'simplecov'

SimpleCov.profiles.define 'gem' do
  add_filter '/spec/'
end

SimpleCov.start 'gem'

require 'sonezaki'
require 'pry-nav'
require 'redis'

support_files = File.expand_path('spec/support/**/*.rb')

Dir[support_files].each { |file| require file }

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.filter_run_excluding :integration unless ENV['ALL']

  config.order = 'random'
end

RSpec::Matchers.define_negated_matcher :not_change, :change
