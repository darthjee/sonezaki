# frozen_string_literal: true

require 'spec_helper'

describe Sonezaki::RedisAccessor do
  subject(:accessor) do
    described_class.new(key, **options)
  end

  let(:key) do
    "SomeKey_#{Random.rand(1000)}"
  end

  let(:options) { {} }

  after do
    Redis.new.delete(key)
  end

  describe "get" do
    context "when nothing has been set" do
      it do
        expect(accessor.get).to be_nil
      end
    end
  end
end
