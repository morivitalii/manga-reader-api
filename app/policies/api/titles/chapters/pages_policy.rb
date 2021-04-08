class Api::Titles::Chapters::PagesPolicy < Api::ApplicationPolicy
  include Api::GroupAccessRights

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user? && user_have_group_access_right?(options[:group], :manage_chapters)
  end

  def permitted_attributes_for_create
    [:number, :file]
  end

  class Scope < Api::ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end