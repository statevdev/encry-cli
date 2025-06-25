# Encry

**Encry** is a deterministic password generator for the command line. It generates site-specific passwords using a master word and a site identifier, based on a KDF (PBKDF2) with user-configurable options.

## Installation

Install from RubyGems:

```bash
$ gem install encry
```

## Usage

Generate a password for a specific site:

```bash
$ encry github
```
After that, “Copied!” will appear and the obtained password will be copied to the clipboard. Just press “Ctrl + V” in the desired password entry field on the site and you're done!

## How does it work?

You don't need to store your passwords anywhere, the result of each password is deterministic, i.e. unambiguously determined by the two words you enter before generating it, namely the master word and the site word. This means that if you enter the same master word and site word, you will ALWAYS get the same result. With this approach, the masterword is both a lock and a key. You don't need to remember a bunch of passwords, just remember the master word and add site-words to it, and you will generate complex secure passwords for each site.

Passwords are not stored anywhere, that's why this is a **no-storage** password manager. You don't have to be afraid of losing access to your password manager, even if you are not at your computer, you can install this gem and access all your passwords, because in fact, they are all stored **in your head** :)

## Examples

You will be prompted for your main word (master password), and a site-specific password will be generated.

Let's imagine a master word, for example -- `tirion`.

```bash
$ encry github
Enter main word: tirion    (don't worry, its a hidden field so no one will see your word!)
Copied!
```
The password was generated and saved to the clipboard. Try pasting it somewhere with Ctrl + V (`r7DkrC8n32b2SZHK`). Now do the same thing again -- the result will be the same!

```bash
$ encry
Enter site word: github
Enter main word: tirion    (don't worry, its a hidden field so no one will see your word!)
Copied!
```

```bash
$ encry --show
Enter site word: github
Enter main word: tirion    (don't worry, its a hidden field so no one will see your word!)
r7DkrC8n32b2SZHK
```

#### Common options

```bash
$ encry github --length 20 --digest sha512 --iterations 200000
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

