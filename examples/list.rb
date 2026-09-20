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
