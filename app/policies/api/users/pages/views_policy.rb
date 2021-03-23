class Api::Users::Pages::ViewsPolicy < Api::ApplicationPolicy
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