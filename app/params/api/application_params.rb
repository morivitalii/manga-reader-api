class Api::ApplicationParams
  # Parameters from controller
  attr_reader :params

  def initialize(params_keys = [], params = {})
    params_values = params.slice(*params_keys).values

    @params = params.present? ? Struct.new(*params_keys).new(*params_values) : nil
  end
end
