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
