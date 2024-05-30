# frozen_string_literal: true

require 'spec_helper'

describe Sonezaki::RedisAccessor do
  describe 'yard' do
    it 'Simple usage' do
      accessor = Sonezaki::RedisAccessor.new('my_key', type: :integer)

      accessor.set('10.1')

      expect(accessor.get).to eq(10)
    end
  end
end
