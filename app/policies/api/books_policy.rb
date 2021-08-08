class Api::BooksPolicy < Api::ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    access_right?(:manage_content)
  end

  def update?
    access_right?(:manage_content)
  end

  def destroy?
    access_right?(:manage_content)
  end

  def permitted_attributes_for_create
    [
      :title, :description, :publication_status, :original_content_language_id, writer_ids: [], painter_ids: [],
      genre_ids: [], format_ids: [], demographic_ids: [], mark_ids: [], theme_ids: []
    ]
  end

	def permitted_attributes_for_update
    [
      :title, :description, :publication_status, :original_content_language_id, writer_ids: [], painter_ids: [],
      genre_ids: [], format_ids: [], demographic_ids: [], mark_ids: [], theme_ids: []
    ]
  end

  class Scope < Api::ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end