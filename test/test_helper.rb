# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'encry'
require 'logger'
require 'minitest/autorun'
require 'minitest-power_assert'

def password_by_options(options)
  Encry.run(options)

  Clipboard.paste
end
