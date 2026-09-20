# frozen_string_literal: true

class RadioModel
  attr_accessor :name, :serial_max_len, :extra_max_len, :default_programming_language
  attr_reader :_serial_regex_patterns, :_extra_regex_patterns

  def initialize(name, serial_max_len, serial_regex_pattern, extra_max_len = 0, extra_regex_pattern = nil)
    @name = name
    @serial_max_len = serial_max_len
    @default_programming_language = "php"
    @_serial_regex_patterns = {}

    if serial_regex_pattern.is_a?(String)
      @_serial_regex_patterns[@default_programming_language] = serial_regex_pattern
    elsif serial_regex_pattern.is_a?(Hash)
      @_serial_regex_patterns = serial_regex_pattern
    end

    @extra_max_len = extra_max_len
    @_extra_regex_patterns = nil
    return if extra_max_len.zero?

    if extra_regex_pattern.is_a?(String)
      @_extra_regex_patterns = { @default_programming_language => extra_regex_pattern }
    elsif extra_regex_pattern.is_a?(Hash)
      @_extra_regex_patterns = extra_regex_pattern
    end
  end

  def serial_regex_pattern
    @_serial_regex_patterns[@default_programming_language] || ""
  end

  def extra_regex_pattern
    return nil if @_extra_regex_patterns.nil?

    @_extra_regex_patterns[@default_programming_language]
  end

  def validate(serial, extra = nil)
    return RadioErrors::INVALID_SERIAL_LENGTH if serial.length != @serial_max_len
    return RadioErrors::INVALID_SERIAL_PATTERN unless match?(serial_regex_pattern, serial)

    if extra && !extra.empty?
      return RadioErrors::INVALID_EXTRA_LENGTH if extra.length != @extra_max_len
      return RadioErrors::INVALID_EXTRA_PATTERN unless match?(extra_regex_pattern, extra)
    end

    RadioErrors::SUCCESS
  end

  private

  def match?(php_regex, value)
    return false if php_regex.nil? || php_regex.to_s.empty?

    re = self.class.php_regex_to_ruby(php_regex)
    return false if re.nil?

    !re.match(value).nil?
  end

  def self.php_regex_to_ruby(pattern)
    return nil if pattern.nil? || pattern.empty?
    return Regexp.new(pattern) unless pattern.start_with?("/")

    last = pattern.rindex("/")
    return Regexp.new(pattern) if last.nil? || last.zero?

    body = pattern[1...last]
    flags = pattern[(last + 1)..] || ""
    opts = 0
    opts |= Regexp::IGNORECASE if flags.include?("i")
    opts |= Regexp::MULTILINE if flags.include?("m")
    Regexp.new(body, opts)
  end
end
