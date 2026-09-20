# frozen_string_literal: true

# Built-in radio models with offline validation metadata.
# ECLIPSE_ESN uses API name "eclipse-esn" (PHP SDK currently lists toyota-erc by mistake).
class RadioModels
  RENAULT_DACIA = ["renault-dacia", 4, "/^([A-Z]{1}[0-9]{3})$/"].freeze
  CHRYSLER_PANASONIC_TM9 = ["chrysler-panasonic-tm9", 4, "/^([0-9]{4})$/"].freeze
  CHRYSLER_DODGE_VP = ["chrysler-dodge-vp", 4, "/^([a-zA-Z0-9]{4})$/"].freeze
  FORD_M_SERIES = ["ford-m-series", 6, "/^([0-9]{6})$/"].freeze
  FORD_V_SERIES = ["ford-v-series", 6, "/^([0-9]{6})$/"].freeze
  FORD_TRAVELPILOT = ["ford-travelpilot", 7, "/^([0-9]{7})$/"].freeze
  FIAT_STILO_BRAVO_VISTEON = ["fiat-stilo-bravo-visteon", 6, "/^([a-zA-Z0-9]{6})$/"].freeze
  FIAT_DAIICHI = ["fiat-daiichi", 4, "/^([0-9]{4})$/"].freeze
  FIAT_VP = ["fiat-vp", 4, "/^([0-9]{4})$/"].freeze
  TOYOTA_ERC = ["toyota-erc", 16, "/^([a-zA-Z0-9]{16})$/"].freeze
  JEEP_CHEROKEE = ["jeep-cherokee", 14, "/^([a-zA-Z0-9]{10}[0-9]{4})$/"].freeze
  NISSAN_GLOVE_BOX = ["nissan-glove-box", 12, "/^([a-zA-Z0-9]{12})$/"].freeze
  ECLIPSE_ESN = ["eclipse-esn", 6, "/^([a-zA-Z0-9]{6})$/"].freeze
  JAGUAR_ALPINE = ["jaguar-alpine", 5, "/^([0-9]{5})$/"].freeze

  def self.get(radio_model_params)
    return radio_model_params if radio_model_params.is_a?(RadioModel)

    RadioModel.new(
      radio_model_params[0],
      radio_model_params[1],
      radio_model_params[2],
      radio_model_params[3] || 0,
      radio_model_params[4] || ""
    )
  end
end
