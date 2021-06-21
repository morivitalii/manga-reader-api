class Api::Books::ChaptersPolicy < Api::ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    group_access_right?(options&.group, :manage_chapters)
  end

  def update?
    group_access_right?(options&.group, :manage_chapters)
  end

  def destroy?
    group_access_right?(options&.group, :manage_chapters)
  end

  def permitted_attributes_for_create
    [:content_language_id, :volume, :group_id, :title, :number, cleaner_ids: [], translator_ids: [], editor_ids: [], typer_ids: []]
  end

  def permitted_attributes_for_update
    [:content_language_id, :volume, :group_id, :title, :number, cleaner_ids: [], translator_ids: [], editor_ids: [], typer_ids: []]
  end

  class Scope < Api::ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end