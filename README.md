# TronHttp Ruby

![Build](https://github.com/sebscholl/tron_http/actions/workflows/main.yml/badge.svg?event=push)

A simple interface to the Tron Network HTTP API.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add tron_http

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install tron_http

## Usage

All endpoint declarations are defined in `lib/data/tron.yml` and get defined when the module is loaded using the `TronHTTP::Config.scaffold` method.

Network methodsare created automatically for Mainnet, Shashta, Tronex, and Nile.

```rb
TronHttp.mainnet.get_transaction_by_id value: 'TX_ID'
TronHttp.tronex.get_transaction_by_id value: 'TX_ID'
TronHttp.shasta.get_transaction_by_id value: 'TX_ID'
TronHttp.nile.get_transaction_by_id value: 'TX_ID'
```

Each instance will use its relevant host when making requests. Create a new instance of any network like so:

```rb
# When no network is specified, defaults to 'shasta'
mainnet_client = TronHttp::Client.new 'mainnet'
```

Every endpoint listed under `endpoints:` in the `lib/data/tron.yml` file is callable on a client instance.

```rb
mainnet_client.get_transaction_by_id value: 'tx_id'
=> {}
```

Ever method requires parameters to be passed as a hash. The passed hash gets stringified and send directly to the relevant endpoint. This makes the interface 1-to-1 with parameters in the [API reference](https://developers.tron.network/reference/background).

```rb
# BAD
mainnet_client.get_transaction_by_id 'bc1dddbf80346c1f67539f2e878170b9324128988dc5ec0fb717ed50135a1a8c'

# GOOD
mainnet_client.get_transaction_by_id value: 'bc1dddbf80346c1f67539f2e878170b9324128988dc5ec0fb717ed50135a1a8c'
```

### API Reference

Each entry in the `data/tron.yml` file specifies all parameters required to make requests to a TRON network.

```yml
endpoints:
  #
  # https://developers.tron.network/reference/gettransactioninfobyid-1
  get_transaction_info_by_id:
    path: /walletsolidity/gettransactioninfobyid
    method: post
    variables:
      value: string!
  #
  # https://developers.tron.network/reference/gettransactioninfobyblocknum-1
  get_transaction_by_block_num:
    path: /walletsolidity/gettransactioninfobyblocknum
    method: post
    variables:
      value: int32
  #
  # List goes on...
```

Any variable with a '!' mark suffixed to it's value is required. All other variables are optional.

To learn more about each method, visit the documentation link included above each methods YAML entry.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sebscholl/tron_http. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/sebscholl/tron-http/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Tron::Http project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/sebscholl/tron-http/blob/master/CODE_OF_CONDUCT.md).
