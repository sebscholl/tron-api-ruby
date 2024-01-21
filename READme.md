# TRON-Ruby

Simple Ruby interface for the TRON Network HTTP API.

## Install

Clone the repo locally and bundle.

```bash
$ git clone https://github.com/sebscholl/trop-api-ruby.git

# and

$ cd tron-api-ruby && bundle install
```

## Usage

Run the start script.

```bash
$ ruby start.rb
```

All endpoint declarations are defined in `data/tron.yml` and get defined when `start.rb` is loaded using the `TronHTTP::Setup.run` method.

Client instances are created automatically for Mainnet, Shashta, Tronex, and Nile.

```rb
@mainnet.get_transaction_by_id value: 'TX_ID'
@tronex.get_transaction_by_id value: 'TX_ID'
@shasta.get_transaction_by_id value: 'TX_ID'
@nile.get_transaction_by_id value: 'TX_ID'
```

Each instance will use its relevant hostname when making requests. Create a new instance of any network like so:

```rb
# When no network is specified, defaults to 'shasta'
client = TronHttp::Client.new 'mainnet'
```

Every endpoint listed under `endpoints:` in the `data/tron.yml` file is callable on a client instance.

```rb
@mainnet.get_transaction_by_id value: 'tx_id'
=> {}
```

Ever method requires parameters to be passed as a hash. The passed hash gets stringified and send directly to the relevant endpoint. This makes the interface 1-to-1 with parameters in the [API reference](https://developers.tron.network/reference/background).

```rb
# BAD
@mainnet.get_transaction_by_id 'bc1dddbf80346c1f67539f2e878170b9324128988dc5ec0fb717ed50135a1a8c'

# GOOD
@mainnet.get_transaction_by_id value: 'bc1dddbf80346c1f67539f2e878170b9324128988dc5ec0fb717ed50135a1a8c'
```

## API Reference

Each entry in the `data/tron.yml` file specifies all parameters required to make requests to a TRON network.

```yml
endpoints:
  #
  # https://developers.tron.network/reference/gettransactioninfobyid-1
  get_transaction_info_by_id:
    path: /walletsolidity/gettransactioninfobyid
    method: POST
    variables:
      value: string!
  #
  # https://developers.tron.network/reference/gettransactioninfobyblocknum-1
  get_transaction_by_block_num:
    path: /walletsolidity/gettransactioninfobyblocknum
    method: POST
    variables:
      value: int32
  #
  # List goes on...
```

Any variable with a '!' mark suffixed to it's value is required. All other variables are optional.

To learn more about each method, visit the documentation link included above each methods YAML entry.
