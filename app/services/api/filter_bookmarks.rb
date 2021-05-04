class Api::FilterBookmarks
  include ActiveModel::Model

  attr_accessor :scope, :params
  attr_reader :bookmarks

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

    @bookmarks = scope.all

    true
  end
end
