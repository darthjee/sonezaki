module Sonezaki
  class RedisAccessor
    attr_reader :key, :type, :ttl

    MONTH = 30 * 24 * 3600

    def initialize(key, type: :string, ttl: MONTH)
      @key = key
      @type = type
      @ttl = ttl
    end

    def set(value)
      options = { ex: ttl }.compact
      connection.set(key, value, **options)
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
      when :integer
        return value.to_f
      end
      value
    end

    def connection
      @connection ||= Redis.new
    end
  end
end
