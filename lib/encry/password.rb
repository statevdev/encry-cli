# frozen_string_literal: true

require 'openssl'
require 'base64'

module Encry
  class Password
    def self.generate(main_word, site_word, options)
      key = derive_key(main_word, site_word, options)

      base64 = Base64.urlsafe_encode64(key)

      base64[0, options[:length]]
    end

    def self.derive_key(main_word, site_word, options)
      salt = Digest::SHA256.digest(site_word)

      begin
        OpenSSL::KDF.pbkdf2_hmac(
          main_word,
          salt: salt,
          iterations: options[:iterations],
          length: options[:key_length],
          hash: options[:digest].downcase
        )
      rescue ArgumentError => e
        warn "Error: #{e.message}"
        exit 1
      end
    end
  end
end
