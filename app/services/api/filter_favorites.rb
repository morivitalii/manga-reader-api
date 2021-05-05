class Api::FilterFavorites
  include ActiveModel::Model

  attr_accessor :scope, :params
  attr_reader :favorites

  def call
    if params.resource_type_context?
      scope.where!(
        resource_type: params.resource_type
      )
    elsif params.resource_type_and_ids_context?
      scope.where!(
        resource_type: params.resource_type,
        resource_id: params.resource_ids
      )
    end

    @favorites = scope.all

    true
  end
end
