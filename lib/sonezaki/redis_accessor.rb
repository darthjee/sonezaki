# frozen_string_literal: true

module Sonezaki
  # @api public
  # @author darthjee
  #
  # Accessor that readis and write values into Redis
  class RedisAccessor
    attr_reader :key, :type, :ttl

    MONTH = 30 * 24 * 3600

    # @param key [Symbol,String] Key used to save the data on redis
    # @param type [Symbol] Type of convertion when retrieving the data
    # @param ttl [Integer] Seconds the data will exist before expiration
    def initialize(key, type: :string, ttl: MONTH)
      @key = key
      @type = type
      @ttl = ttl
    end

    # Save the value into redis
    #
    # @param value [Object] Object to be saved
    #
    # Saving will convert the value as string
    #
    # @return [Object] the value itself as it is read from Redis
    def set(value)
      options = { ex: ttl }.compact
      connection.set(key, value, **options)
      get
    end

    def get
      value = connection.get(key)
      return unless value
      return value unless type

      convert(value)
    end

    private

    def convert(value)
      case type
      when :integer
        return value.to_i
      when :float
        return value.to_f
      end
      value
    end

    def connection
      @connection ||= build_connection
    end

    def build_connection
      require 'redis'

      Redis.new
    end
  end
end
