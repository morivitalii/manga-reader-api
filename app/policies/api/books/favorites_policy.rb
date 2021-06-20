class Api::Books::FavoritesPolicy < Api::ApplicationPolicy
  def create?
    user?
  end

  def destroy?
    user? && user.id == options&.favorite&.user_id
  end

  class Scope < Api::ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end