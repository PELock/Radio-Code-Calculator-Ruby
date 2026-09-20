# Radio Code Calculator — Ruby Web API SDK

Ruby SDK for [Radio Code Calculator](https://www.pelock.com/products/radio-code-calculator).

API: https://www.pelock.com/api/radio-code-calculator/v1

Author: Bartosz Wójcik / PELock — https://www.pelock.com

## Installation

This gem is not published on RubyGems. Build it locally:

```bash
gem build radio-code-calculator.gemspec
gem install radio-code-calculator-*.gem
```

Or from a clone without installing:

```ruby
$LOAD_PATH.unshift(File.expand_path("lib", __dir__))
require "radio-code-calculator"
```

Uses Ruby stdlib `Net::HTTP` only (no Faraday).

## Usage

```ruby
require "radio-code-calculator"

client = RadioCodeCalculator.new("YOUR-WEB-API-KEY")
model = RadioModels.get(RadioModels::FORD_M_SERIES)
error = model.validate("123456")
error, result = client.calc(model, "123456")
puts result["code"] if error == RadioErrors::SUCCESS
```

See `examples/`.

`login`, `calc`, `info`, and `list` return `[error, payload]` like the PHP SDK.

## License

Apache-2.0. Copyright Bartosz Wójcik / PELock.
