# frozen_string_literal: true

require 'optparse'
require_relative 'validator'

module Encry
  class Parser
    def initialize(options)
      @options = options
    end

    def run(argv)
      begin
        build.parse!(argv)
      rescue OptionParser::InvalidOption, OptionParser::InvalidArgument, OptionParser::MissingArgument => e
        warn "Error: #{e.message}"
        warn 'Use `--help` to see available @options'
        exit 1
      end

      Validator.run(@options)
    end

    private

    def build
      OptionParser.new do |opts|
        opts.banner = 'Usage: encry [site] [options]'

        add_password_options(opts)
        add_input_options(opts)
        add_output_options(opts)
        add_misc_options(opts)
      end
    end

    def add_password_options(opts)
      opts.on('-l', '--length N', Integer, 'Output password length (default: 16)') { |v| @options[:length] = v }
      opts.on('-i', '--iterations N', Integer, 'KDF iterations (default: 100000)') { |v| @options[:iterations] = v }
      opts.on('-d', '--digest NAME', String, 'Digest algorithm (sha256, sha512...)') { |v| @options[:digest] = v }
      opts.on('--key-length N', Integer, 'Derived key length in bytes (default: 32)') { |v| @options[:key_length] = v }
    end

    def add_input_options(opts)
      opts.on('--main WORD', String, 'Main word (insecure)') { |v| @options[:main_word] = v }
      opts.on('--env VAR', String, 'Read main word from ENV') { |v| @options[:main_word] = ENV.fetch(v, nil) }
      opts.on('--stdin', 'Read main word from STDIN') do
        print 'Enter main word: '
        @options[:main_word] = gets.chomp
      end
    end

    def add_output_options(opts)
      opts.on('--show', 'Show password instead of copying') do
        @options[:show] = true
        @options[:copy] = false
      end
      opts.on('--no-copy', "Don't copy to clipboard") { @options[:copy] = false }
      opts.on('--quiet', 'No output') { @options[:quiet] = true }
      opts.on('--debug', 'Show debug information') { @options[:debug] = true }
    end

    def add_misc_options(opts)
      opts.on('--version', 'Show version') do
        puts Encry::VERSION
        exit
      end
      opts.on('-h', '--help', 'Show help') do
        puts opts
        exit
      end
      opts.on('--list-digests', 'List supported digest algorithms') do
        puts Validator::AVAILABLE_DIGESTS.sort.join("\n")
        exit
      end
    end
  end
end
