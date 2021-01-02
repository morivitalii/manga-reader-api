class Api::ThemesPolicy < Api::ApplicationPolicy
  def index?
    true
  end
end