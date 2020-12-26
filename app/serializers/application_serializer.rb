class ApplicationSerializer
  def initialize(model = nil, options = {})
    options.assert_valid_keys(
      :except
    )
    @model = model
    @except_attributes = options[:except]
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

    if except_attributes.present?
      attributes = attributes.except(*except_attributes)
    end

    attributes
  end

  private

  attr_reader :model, :except_attributes
end
