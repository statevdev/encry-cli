# frozen_string_literal: true

require 'io/console'

module Encry
  class Inputs
    def self.get_main_word(options)
      return options[:main_word] if options[:main_word]

      print 'Enter main word: '
      main_word = $stdin.noecho(&:gets).tap { puts }.chomp

      abort('Main word is empty') if main_word.strip.empty?

      main_word
    end

    def self.get_site_word(argv)
      return argv[0] if argv[0]

      print 'Enter site word: '
      site_word = gets.chomp

      abort('Site word is empty') if site_word.strip.empty?

      site_word
    end
  end
end
