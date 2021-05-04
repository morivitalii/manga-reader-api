class Api::InvalidParams < StandardError
  attr_reader :parameter, :error

  def initialize(parameter, error = "Invalid value")
    @parameter = parameter

    super(error)
  end
end
