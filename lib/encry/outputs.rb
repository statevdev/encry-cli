# frozen_string_literal: true

require 'clipboard'

module Encry
  class Outputs
    def initialize(site_word, password, options)
      @site_word = site_word
      @password = password
      @options = options
    end

    def password
      show_debug_info if @options[:debug]

      if @options[:show]
        puts @password
      elsif @options[:copy]
        Clipboard.copy(@password)
        puts 'Copied!' unless @options[:quiet]
      end
    end

    private

    def show_debug_info
      return unless @options[:debug]

      puts "[DEBUG] Site: #{@site_word}"
      puts "[DEBUG] Digest: #{@options[:digest]}"
      puts "[DEBUG] Iterations: #{@options[:iterations]}"
      puts "[DEBUG] Key length: #{@options[:key_length]}"
      puts "[DEBUG] Output length: #{@options[:length]}"
      puts "[DEBUG] Final password: #{@password}"
    end
  end
end
