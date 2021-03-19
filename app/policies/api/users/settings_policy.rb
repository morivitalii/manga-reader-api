class Api::Users::SettingsPolicy < Api::ApplicationPolicy
  def show?
    user?
  end

  def update?
    user?
  end

  def permitted_attributes_for_update
    [:name, :surname, :sex, :avatar, :interface_language_id, content_language_ids: [], excluded_tag_ids: []]
  end
end