# frozen_string_literal: true

module Encry
  class Options
    DEFAULT = {
      length: 16,
      iterations: 100_000,
      digest: 'sha256',
      key_length: 32,
      show: false,
      copy: true,
      quiet: false
    }.freeze
  end
end
