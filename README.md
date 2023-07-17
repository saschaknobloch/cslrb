# Cslrb

Cslrb is a gem which uses the Rust library [cardano-serialization-lib](https://github.com/Emurgo/cardano-serialization-lib) to make some of its features available in Ruby.

> Cardano Serialization Lib is a library, written in Rust, for serialization & deserialization of data structures used in Cardano's Haskell implementation of Alonzo along with useful utility functions.

## Installation

In order to use this library you will need to have access to Rust's build tooling [cargo](https://doc.rust-lang.org/cargo/getting-started/installation.html), this simplest way to get this is via [rustup](https://rustup.rs/).

After ensuring you have these things available, add the gem to your bundle

```ruby
gem 'cslrb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cslrb

`cslrb` includes a Rake task which will compile the Rust library for your platform and copy it to the correct location.

## Usage

`cslrb` currently provides a single method, `Cslrb::TransactionBody.from_hex` which accepts a string (TX CBOR as hex).

```shell
pry(main)> cbor_hex = "84a40081825820f97da637cc2e8b5b970b1952bcdc62422e82873bb0503a75ab70ed3c3476e9cc010182825839010a7bc8293ae50dd74ae399b261446abff238ea7c564ad52a52168e0b8c6663f1d8c19ba014cf7357207946d54731f2535ae8720c667cdbbc1a000f42408258390177992ea7e2b434bd4ba92e3b2c9592c0805a4552e1d2bb7a7e9c726b4b3ff6604e58320d841aa3af6d4aca9583bd3741ec93518d973a498e1a022468b3021a0002917d031a05d25734a10081825820e41c3c43e11599b056d0de12a55ef49346bb941fcafef7aad08a7b3361b4ccf55840b1fb566bacc3c5f97748dd281f65abec51c64814c289ddcd2792e094091750755542ef4cea7d423a09066486fb2ce185da6fef380dbf65fcadb9bda6c697d701f5f6"
pry(main)> Cslrb::TransactionBody.from_hex(cbor_hex)
=>  "{\n  \"inputs\": [\n    {\n      \"transaction_id\": \"f97da637cc2e8b5b970b1952bcdc62422e82873bb0503a75ab70ed3c3476e9c...
```

Passing anything other than a `String` will result in an error.

## Available Methods

```ruby
Cslrb::TransactionBody.from_hex(cbor_hex)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/cslrb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
