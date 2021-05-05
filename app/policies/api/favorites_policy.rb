class Api::FavoritesPolicy < Api::ApplicationPolicy
  def index?
    user?
  end

  class Scope < Api::ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end

  def permitted_attributes_for_index
    [:resource_type, :resource_ids, :page, :limit]
  end
end
