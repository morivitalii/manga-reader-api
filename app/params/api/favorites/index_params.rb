class Api::Favorites::IndexParams < Api::ApplicationParams
  def resource_type
    return nil unless params.respond_to?(:resource_type)
    return @resource_type if defined?(@resource_type)

    allowed_types = Favorite::RESOURCE_TYPES.map(&:to_s)
    @resource_type = params.resource_type

    unless @resource_type.in?(allowed_types)
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
    return @page if defined?(@page)

    incompatible_attributes = [:resource_ids]
    incompatible_attributes_hash = params.to_h.select { |key, value| key.in?(incompatible_attributes) && value.present? }
    incompatible_attributes_keys = incompatible_attributes_hash.keys.join(", ")

    if incompatible_attributes_keys.present?
      raise Api::InvalidParams.new(
        :page,
        error: "Attributes #{incompatible_attributes_keys} are incompatible with page parameter"
      )
    end

    @page = params.page
  end

  def resource_type_context?
    params.respond_to?(:resource_type) && !params.respond_to?(:resource_ids)
  end

  def resource_type_and_ids_context?
    params.respond_to?(:resource_type) && params.respond_to?(:resource_ids)
  end
end