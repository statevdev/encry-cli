# frozen_string_literal: true

require_relative 'encry/version'

module Encry
  autoload :Parser, File.expand_path('encry/parser.rb', __dir__)
  autoload :Password, File.expand_path('encry/password.rb', __dir__)
  autoload :Options, File.expand_path('encry/options.rb', __dir__)
  autoload :Inputs, File.expand_path('encry/inputs.rb', __dir__)
  autoload :Outputs, File.expand_path('encry/outputs.rb', __dir__)

  class Error < StandardError; end

  def self.run(argv)
    options = Options::DEFAULT.dup

    parser = Parser.new(options)
    parser.run(argv)

    site_word = Inputs.get_site_word(argv)
    main_word = Inputs.get_main_word(options)

    password = Password.generate(main_word, site_word, options)

    output = Outputs.new(site_word, password, options)
    output.password
  end
end
