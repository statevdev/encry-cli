# Encry

**Encry** is a no-storage deterministic password generator for the command line. It generates site-specific passwords using a master word and a site identifier, based on a KDF (PBKDF2) with user-configurable options.

## Installation

Install from RubyGems:

```bash
gem install encry
```

## Usage

Generate a password for a specific site:

```bash
encry github
```

You will be prompted for your main word (master password), and a site-specific password will be generated.

#### Common options

```bash
encry github --length 20 --digest sha512 --iterations 200000
```

#### All available options

	--length N – Output password length (default: 16)

	--iterations N – Number of KDF iterations (default: 100000)

	--digest NAME – Digest algorithm (sha256, sha512, sha3-512, etc.)

	--key-length N – Derived key length in bytes (default: 32)

	--main WORD – Provide main word as plain text (insecure)

	--env VAR – Read main word from environment variable

	--stdin – Read main word from STDIN (default behavior)

	--show – Show the password in the terminal instead of copying

	--no-copy – Do not copy the password to the clipboard

	--quiet – Suppress output

	--debug – Print debug information

	--list-digests – List supported digest algorithms

	--version – Show version

	--help – Show usage information


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

