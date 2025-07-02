# frozen_string_literal: true

require 'test_helper'

class TestEncry < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Encry::VERSION
  end

  def test_default_run
    assert { password_by_options(['test', '--main', 'secret', '--quiet']) == '6eQpk0_vaGn2dkjI' }
  end

  def test_run_with_length_option
    assert { password_by_options(['test', '--main', 'secret', '--quiet', '-l', '6']) == '6eQpk0' }
  end

  def test_run_with_iteration_option
    assert { password_by_options(['test', '--main', 'secret', '--quiet', '-i', '100']) == 'tZtPh0SmlOX_Jj8l' }
  end

  def test_run_with_digest_option
    assert { password_by_options(['test', '--main', 'secret', '--quiet', '-d', 'sha1']) == 'rkS3n8gdBr5dbLQj' }
  end

  def test_run_with_key_lenght_option
    assert { password_by_options(['test', '--main', 'secret', '--quiet', '--key-length', '10']) == '6eQpk0_vaGn2dg==' }
  end

  def test_run_with_env_option
    ENV['TEST_ENCRY_ENV'] = 'secret'

    assert { password_by_options(['test', '--quiet', '--env', 'TEST_ENCRY_ENV']) == '6eQpk0_vaGn2dkjI' }
  end

  def test_fail_with_length_option
    #assert { password_by_options(['test', '--main', 'secret', '--quiet', '-l', '6']) == '6eQpk0' }
  end
end
