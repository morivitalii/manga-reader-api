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

  def self.serialize_associations(name, options = {})
    serialize_association(name, options)
  end

  def self.serialize_association(name, options = {})
    serializer_class = options.delete(:with)

    define_method(name) do
      return serialized_objects[name] if serialized_objects.key?(name)

      if model.association(name).loaded?
        value = model.send(name)

        serialized_objects[name] = serializer_class.serialize(value, options)
      else
        model_class = model.respond_to?(:object) ? model.object.class : model.class
        macro = model_class.reflect_on_association(name).macro

        serialized_objects[name] = macro.in?([:belongs_to, :has_one]) ? nil : []
      end

      serialized_objects[name]
    end
  end

  def self.serialize_objects(name, options = {})
    serialize_object(name, options)
  end

  def self.serialize_object(name, options = {})
    serializer_class = options.delete(:with)

    define_method(name) do
      return serialized_objects[name] if serialized_objects.key?(name)

      value = model.send(name)

      if value.is_a?(Enumerable)
        serialized_objects[name] = value.present? ? serializer_class.serialize(value, options) : []
      else
        serialized_objects[name] = value.present? ? serializer_class.serialize(value, options) : nil
      end

      serialized_objects[name]
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

  def serialized_objects
    @serialized_objects ||= {}
  end

  attr_reader :model, :options
end
