class Api::Titles::ChaptersPolicy < Api::ApplicationPolicy
  include Api::GroupAccessRights

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user? && options[:group].present? && user_have_group_access_right?(options[:group], :manage_chapters)
  end

  def update?
    user? && options[:group].present? && user_have_group_access_right?(options[:group], :manage_chapters)
  end

  def destroy?
    user? && options[:group].present? && user_have_group_access_right?(options[:group], :manage_chapters)
  end

  def permitted_attributes_for_create
    [:content_language_id, :volume_id, :group_id, :name, :number, cleaner_ids: [], translator_ids: [], editor_ids: [], typer_ids: []]
  end

  def permitted_attributes_for_update
    [:content_language_id, :volume_id, :group_id, :name, :number, cleaner_ids: [], translator_ids: [], editor_ids: [], typer_ids: []]
  end

  class Scope < Api::ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end