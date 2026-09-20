# frozen_string_literal: true

class RadioCodeCalculator
  API_URL = "https://www.pelock.com/api/radio-code-calculator/v1"
  USER_AGENT = "PELock Radio Code Calculator"

  attr_accessor :api_key

  def initialize(api_key = nil)
    @api_key = api_key
  end

  def login
    result = post_request("command" => "login")
    [result["error"], result]
  end

  def calc(radio_model, radio_serial_number, radio_extra_data = "")
    model_name = self.class.model_name(radio_model)
    result = post_request(
      "command" => "calc",
      "radio_model" => model_name,
      "serial" => radio_serial_number,
      "extra" => radio_extra_data
    )
    [result["error"], result]
  end

  def info(radio_model)
    model_name = self.class.model_name(radio_model)
    result = post_request("command" => "info", "radio_model" => model_name)
    return [result["error"], nil] unless result["error"] == RadioErrors::SUCCESS

    model = RadioModel.new(
      model_name,
      result["serialMaxLen"],
      result["serialRegexPattern"],
      result["extraMaxLen"],
      result["extraRegexPattern"]
    )
    [result["error"], model]
  end

  def list
    result = post_request("command" => "list")
    return [result["error"], nil] unless result["error"] == RadioErrors::SUCCESS

    radio_models = []
    (result["supportedRadioModels"] || {}).each do |radio_model_name, radio_model|
      radio_models << RadioModel.new(
        radio_model_name,
        radio_model["serialMaxLen"],
        radio_model["serialRegexPattern"],
        radio_model["extraMaxLen"],
        radio_model["extraRegexPattern"]
      )
    end
    [result["error"], radio_models]
  end

  def post_request(params_array)
    params = params_array.dup
    params["key"] = @api_key unless @api_key.nil? || @api_key.to_s.empty?
    default_error = { "error" => RadioErrors::ERROR_CONNECTION }

    body = Http.post_multipart(API_URL, params, user_agent: USER_AGENT)
    return default_error if body.nil? || body.empty?

    result = Http.parse_json(body)
    result.is_a?(Hash) && !result.empty? ? result : default_error
  end

  def self.model_name(radio_model)
    case radio_model
    when RadioModel then radio_model.name
    when Array then radio_model[0].to_s
    else radio_model.to_s
    end
  end
end
