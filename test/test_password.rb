# frozen_string_literal: true

require 'test_helper'

class TestPassword < Minitest::Test
  def test_generate
    result = Encry::Password.generate('secret', 'test', Encry::Options::DEFAULT) 
    assert { result == '6eQpk0_vaGn2dkjI' }
  end
end
