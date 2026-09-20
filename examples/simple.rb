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
