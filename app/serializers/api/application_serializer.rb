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

  def self.serialize_association(association, options = {})
    options.assert_valid_keys(:with, :options)

    serializer_class = options.delete(:with)
    serializer_options = options.delete(:options)

    define_method(association) do
      serialized_associations[association] ||= serializer_class.serialize(model.send(association), serializer_options)
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

  def serialized_associations
    @serialized_associations ||= {}
  end

  attr_reader :model, :options
end
