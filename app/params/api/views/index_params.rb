class Api::Views::IndexParams < Api::ApplicationParams
  def resource_type
    return nil unless params.respond_to?(:resource_type)
    return @resource_type if defined?(@resource_type)

    if params.resource_type.in?(allowed_types)
      @resource_type = params.resource_type
    else
      raise Api::InvalidParams.new(
        :resource_type,
        error: "Allowed values for resource_type are #{allowed_types.join(", ")}"
      )
    end

    @resource_type
  end

  def resource_ids
    return nil unless params.respond_to?(:resource_ids)
    return @resource_ids if defined?(@resource_ids)

    limit = 150
    @resource_ids = params.resource_ids&.compact&.map(&:to_i)&.uniq

    if @resource_ids.size > limit
      raise Api::InvalidParams.new(:resource_type, error: "Maximum amount of resource_ids is #{limit} items")
    end

    @resource_ids
  end

  def page
    return nil unless params.respond_to?(:page)

    check_compatibility!(:page, [:resource_ids])

    params.page
  end

  def resource_type_context?
    params.respond_to?(:resource_type) && !params.respond_to?(:resource_ids)
  end

  def resource_type_and_ids_context?
    params.respond_to?(:resource_type) && params.respond_to?(:resource_ids)
  end

  private

  def allowed_types
    View::RESOURCE_TYPES
  end

  def pagination_incompatible_attributes
    return @pagination_incompatible_attributes if defined?(@pagination_incompatible_attributes)

    attributes = [:resource_ids]
    hash = params.to_h.select { |key, value| key.in?(attributes) && value.present? }

    @pagination_incompatible_attributes = hash.keys
  end
end