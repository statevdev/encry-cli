# frozen_string_literal: true

module Encry
  class Validator
    AVAILABLE_DIGESTS = %w[
      blake2b512
      blake2s256
      md5
      rmd160
      sha1
      sha224
      sha256
      sha3-224
      sha3-256
      sha3-384
      sha3-512
      sha384
      sha512
      sha512-224
      sha512-256
      sm3
    ].freeze

    def self.run(options)
      unless AVAILABLE_DIGESTS.include?(options[:digest].downcase)
        warn "Invalid digest algorithm: #{options[:digest]}"
        warn "Available algorithms: #{AVAILABLE_DIGESTS.sort.join(', ')}"
        exit 1
      end

      abort('Error: --key-length option must be greater than 0') if options[:key_length] <= 0
      abort('Error: --iterations option must be greater than 0') if options[:iterations] <= 0
      abort('Error: --length option must be greater than 0') if options[:length] <= 0
    end
  end
end
