# Radio Code Calculator Online & SDK for Ruby

**[Radio Code Calculator](https://www.pelock.com/products/radio-code-calculator)** is an online service along with [Web API & SDK](https://www.pelock.com/products/radio-code-calculator/sdk) for generating car radio unlock codes for popular vehicle brands.

Following a breakdown or a disconnection of the car battery, most of the vehicle radio & navigation units will ask for an unlocking code. It's standard anti-theft protection.

Our car Radio Code Calculator allows you to generate **100% valid** radio codes to unlock car radios & navigation without the need to use the expensive service of authorized dealers.

![Radio Code Calculator](https://www.pelock.com/img/en/products/radio-code-calculator/car-radio-code-calculator-online-web-api-sdk.jpg)

The service is available through a simple online interface and `Web API`, with multiple `SDK` development libraries for popular programming languages.

Thanks to our solution, you can create, for instance, mobile or web applications that allow for easy generation of radio codes.

## Supported car models and radios

Our service is being continuously developed and new algorithms are gradually added for new car models and their radios.

If a new algorithm is added, you will get automatic and free access to it as part of your current license.

Individual calculators are available on our site as a paid service for end customers. You can verify them and see lists of supported radios on the relevant subpages:

* [Renault & Dacia](https://www.pelock.com/products/renault-and-dacia-car-radio-code-calculator-generator)
* [Toyota ERC](https://www.pelock.com/products/toyota-erc-calculator-radio-unlock-code-generator)
* [Jeep Cherokee](https://www.pelock.com/products/jeep-cherokee-radio-unlock-code-calculator-generator)
* [Ford M Serial](https://www.pelock.com/products/ford-radio-code-m-serial-calculator-generator)
* [Ford V Serial](https://www.pelock.com/products/ford-radio-code-v-serial-calculator-generator)
* [Ford TravelPilot EX, FX & NX](https://www.pelock.com/products/ford-travelpilot-ex-fx-nx-radio-code-generator-calculator)
* [Chrysler Panasonic TM9](https://www.pelock.com/products/chrysler-panasonic-tm9-car-radio-code-calculator-generator)
* [Chrysler Dodge Ram VP2](https://www.pelock.com/products/chrysler-dodge-ram-uconnect-harman-kardon-radio-code)  
* [Fiat Stilo & Bravo Visteon](https://www.pelock.com/products/fiat-stilo-bravo-visteon-radio-code-calculator-generator)
* [Fiat DAIICHI MOPAR](https://www.pelock.com/products/fiat-daiichi-radio-code-calculator-generator)
* [Fiat Continental 250 & 500 VP1/VP2](https://www.pelock.com/products/fiat-250-500-vp1-vp2-radio-code-calculator-generator)  
* [Nissan Glove Box Immobiliser PIN](https://www.pelock.com/products/nissan-glove-box-pin-code-calculator)
* [Eclipse ESN Unlock Code Calculator](https://www.pelock.com/products/eclipse-esn-unlock-code-calculator)
* [Jaguar Alpine](https://www.pelock.com/products/jaguar-alpine-car-radio-unlock-code-calculator)

## Use of radio code calculator

Where and who can use the radio code generation service and make money from code generation?

### ![Android](https://www.pelock.com/img/en/icons/android-32.png) App developers 
The main audience for our software is clearly developers and programmers, either of mobile or desktop applications.

### ![Shoping cart](https://www.pelock.com/img/en/icons/cart-32.png) Online stores 
If you run an online e-commerce store, you can sell radio codes through it using our software solutions.

### ![Car](https://www.pelock.com/img/en/icons/car-32.png) Auto repair shops
We also encourage car repair shops whose customers often use car radio unlocking services.

### ![Person](https://www.pelock.com/img/en/icons/user-32.png) Private individuals
Private individuals will also profit from our solution by generating codes and selling them on car forums or auction sites such as eBay, Craigslist.

### No limits!

You can generate codes **without limitation** with your purchased one year license.

Set your own price for generating a single code and start earning by using **tried and tested** algorithms from a programming language you know.

If you are not a programmer - don't worry. Just use our [online calculator](https://www.pelock.com/products/radio-code-calculator/online).

## Installation

The preferred way to install the Web API SDK is via RubyGems.

```bash
gem install radio-code-calculator
```

```ruby
require "radio-code-calculator"
```

The gem is published at https://rubygems.org/gems/radio-code-calculator

## Packages for other programming languages

The installation packages have been uploaded to repositories for several popular programming languages and their source codes have been published on GitHub:

| Repository   | Language | Installation | Package | GitHub |
| ------------ | ---------| ------------ | ------- | ------ |
| ![Packagist repository for PHP and Composer](https://www.pelock.com/img/logos/repo-packagist-composer.png) | PHP | Add the following line to `require` section of your `composer.json` file `"pelock/radio-code-calculator": "*"` | [Packagist](https://packagist.org/packages/pelock/radio-code-calculator) | [Sources](https://github.com/PELock/Radio-Code-Calculator-PHP)
| ![PyPI repository for Python](https://www.pelock.com/img/logos/repo-pypi.png) | Python | Run `pip install radio-code-calculator` | [PyPi](https://pypi.org/project/radio-code-calculator/) | [Sources](https://github.com/PELock/Radio-Code-Calculator-Python)
| ![NPM repository for JavaScript and TypeScript](https://www.pelock.com/img/logos/repo-npm.png) | JavaScript, TypeScript | Run `npm i radio-code-calculator` or add the following to `dependencies` section of your `package.json` file `"dependencies": { "radio-code-calculator": "latest" },` | [NPM](https://www.npmjs.com/package/radio-code-calculator) | [Sources](https://github.com/PELock/Radio-Code-Calculator-JavaScript)

## Usage examples

### Example — `list.rb`

```ruby
# frozen_string_literal: true

###############################################################################
#
# Radio Code Calculator — list models
#
# Version        : v1.1.6
# Language       : Ruby
# Author         : Bartosz Wójcik
# Web page       : https://www.pelock.com
#
###############################################################################

$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))
require "radio-code-calculator"

error, models = RadioCodeCalculator.new("YOUR-WEB-API-KEY").list
if error == RadioErrors::SUCCESS
  models.each { |m| puts "#{m.name} serial=#{m.serial_max_len} #{m.serial_regex_pattern}" }
else
  warn "Error: #{error}"
end
```

### Example — `login.rb`

```ruby
# frozen_string_literal: true

###############################################################################
#
# Radio Code Calculator — login
#
# Version        : v1.1.6
# Language       : Ruby
# Author         : Bartosz Wójcik
# Web page       : https://www.pelock.com
#
###############################################################################

$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))
require "radio-code-calculator"

error, result = RadioCodeCalculator.new("YOUR-WEB-API-KEY").login
p [error, result]
```

### Example — `offline_validation.rb`

```ruby
# frozen_string_literal: true

###############################################################################
#
# Radio Code Calculator — offline validation
#
# Version        : v1.1.6
# Language       : Ruby
# Author         : Bartosz Wójcik
# Web page       : https://www.pelock.com
#
###############################################################################

$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))
require "radio-code-calculator"

model = RadioModels.get(RadioModels::FORD_M_SERIES)
puts model.validate("123456") # 0 = SUCCESS
puts model.validate("1")      # INVALID_SERIAL_LENGTH
puts model.validate("12345A") # INVALID_SERIAL_PATTERN
```

### Example — `simple.rb`

```ruby
# frozen_string_literal: true

###############################################################################
#
# Radio Code Calculator — generate a code
#
# Version        : v1.1.6
# Language       : Ruby
# Author         : Bartosz Wójcik
# Web page       : https://www.pelock.com
#
###############################################################################

$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))
require "radio-code-calculator"

client = RadioCodeCalculator.new("YOUR-WEB-API-KEY")
error, result = client.calc(RadioModels.get(RadioModels::FORD_M_SERIES), "123456")

case error
when RadioErrors::SUCCESS
  puts "Radio code is #{result["code"]}"
when RadioErrors::INVALID_RADIO_MODEL
  puts "Invalid radio model (not supported)"
when RadioErrors::INVALID_LICENSE
  puts "Invalid license key!"
else
  puts "Error: #{error}"
end
```

See the `examples/` directory in this repository for complete samples.

## Got questions?

If you are interested in the Radio Code Calculator Web API or have any questions regarding radio code generator SDK packages, technical or legal issues, or if something is not clear, [please contact me](https://www.pelock.com/contact). I'll be happy to answer all of your questions.

Bartosz Wójcik

* Visit my site at — https://www.pelock.com
* Twitter — https://twitter.com/PELock
* GitHub — https://github.com/PELock