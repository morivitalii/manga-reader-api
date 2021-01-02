class Api::ThemesPolicy < Api::ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end
end