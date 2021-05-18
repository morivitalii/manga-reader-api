class Api::ApplicationParams
  # Parameters from controller
  attr_reader :params

  def initialize(params = {})
    keys = params.keys.map(&:to_sym)

    @params = params.present? ? Struct.new(*keys).new(*params.values) : nil
  end

  private

  def check_compatibility!(attribute, incompatible_attributes)
    return unless params.respond_to?(attribute)
    return if params.public_send(attribute).blank?

    if params.to_h.any? { |key, value| key.in?(incompatible_attributes) && value.present? }
      raise Api::InvalidParams.new(
        attribute,
        error: "Parameter #{attribute} is incompatible with #{incompatible_attributes.join(", ")} parameter(s)"
      )
    end
  end
end
