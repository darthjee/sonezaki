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

  describe '#get' do
    context 'when nothing has been set' do
      it do
        expect(accessor.get).to be_nil
      end
    end

    context 'when a value has been set' do
      let(:value) { Random.rand(1_000_000) / 100.0 }

      before do
        Redis.new.set(key, value)
      end

      context 'when type option is not given' do
        it 'returns the string for the value' do
          expect(accessor.get).to eq(value.to_s)
        end
      end

      context 'when type option is integer' do
        let(:options) { { type: :integer } }

        it 'returns the integer for the value' do
          expect(accessor.get).to eq(value.to_i)
        end
      end

      context 'when type option is float' do
        let(:options) { { type: :float } }

        it 'returns the float for the value' do
          expect(accessor.get).to eq(value)
        end
      end
    end
  end

  describe '#set' do
    let(:value) { Random.rand(100_000) / 10.0 }

    context 'when type has not been defined' do
      it 'returns the stored value' do
        expect(accessor.set(value)).to eq(value.to_s)
      end

      it 'stores the value for future reading' do
        expect { accessor.set(value) }
          .to change(accessor, :get)
          .from(nil)
          .to(value.to_s)
      end

      it 'stores the value in redis' do
        expect { accessor.set(value) }
          .to change { Redis.new.get(key) }
          .from(nil)
          .to(value.to_s)
      end
    end

    context 'when type has been defined as integer' do
      let(:options) { { type: :integer } }

      it 'returns the stored value' do
        expect(accessor.set(value)).to eq(value.to_i)
      end

      it 'stores the value for future reading' do
        expect { accessor.set(value) }
          .to change(accessor, :get)
          .from(nil)
          .to(value.to_i)
      end

      it 'stores the value in redis' do
        expect { accessor.set(value) }
          .to change { Redis.new.get(key) }
          .from(nil)
          .to(value.to_s)
      end
    end
  end
end
