module AddressValidator
  FIELD_NAMES = [:street, :city, :county, :postal_code, :country]
  VALID_VALUE = /^[A-Za-z0-9\.\# ]+$/

  class << self
    def valid?(object)
      normalized = parse(object)
      FIELD_NAMES.all? do |key|
        value = normalized[key]
        !value.nil? && value != '' && valid_part?(value)
      end
    end

    def missing_parts(object)
      normalized = parse(object)
      FIELD_NAMES - normalized.keys
    end

    def invalid_parts(object)
      normalized = parse(object)
      normalized.reject{|k, v| valid_part?(normalized[k])}.keys
    end

    private

    def parse(object)
      if(object.is_a?(String))
        values = object.split(',').map(&:strip)
        Hash[FIELD_NAMES.zip(values)]
      elsif(object.is_a?(Hash))
        object
      else
        raise "Don't know how to parse #{object.class}"
      end
    end

    def valid_part?(value)
      value =~ VALID_VALUE
    end
  end
end
