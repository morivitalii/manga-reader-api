class Api::BookmarksPolicy < Api::ApplicationPolicy
  def index?
    user?
  end

  class Scope < Api::ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end

  def permitted_attributes_for_index
    [:title_ids, :chapter_ids, :pages_ids]
  end
end
