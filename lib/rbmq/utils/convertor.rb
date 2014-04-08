module Rbmq
  module Utils
    module Convertor
      def to_hash_of str_with_colon
        Hash[Array(str_with_colon).map { |str| str.split(':') }].symbolize_keys!
      end

      def to_ary_of hash_with_colon
        hash_with_colon.map { |k, v| "#{k.to_s}:#{v}" }
      end
    end
  end
end
