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
    Redis.new.del(key)
  end

  describe "get" do
    context "when nothing has been set" do
      it do
        expect(accessor.get).to be_nil
      end
    end

    context "when a value has been set" do
      let(:value) { Random.rand(1000) }

      before do
        Redis.new.set(key, value)
      end

      context "when type option is not given"do
        it "returns the string for the value" do
          expect(accessor.get).to eq(value.to_s)
        end
      end

      context "when type option is integer" do
        let(:options) { { type: :integer } }

        it "returns the string for the value" do
          expect(accessor.get).to eq(value)
        end
      end
    end
  end
end
