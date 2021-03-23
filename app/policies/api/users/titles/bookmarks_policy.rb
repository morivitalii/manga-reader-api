class Api::Users::Titles::BookmarksPolicy < Api::ApplicationPolicy
  def index?
    user?
  end

  def permitted_attributes_for_index
    {
      filter: {
        ids: []
      }
    }
  end

  class Scope < Api::ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end