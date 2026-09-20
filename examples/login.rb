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
