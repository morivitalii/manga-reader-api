class Api::ApplicationSerializer
  def initialize(model = nil, options = {})
    options.assert_valid_keys(:except)

    @model = model
    @options = options
  end

  def self.serialize(object, options = {})
    if object.is_a?(Enumerable)
      return [] if object.blank?

      object.map { |object| new(object, options) }
    else
      return nil if object.blank?

      new(object, options)
    end
  end

  def as_json(_options = {})
    attributes = self.attributes

    if options[:except].present?
      attributes = attributes.except(*options[:except])
    end

    attributes
  end

  private

  attr_reader :model, :options
end
