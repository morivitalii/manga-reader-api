class Api::UsersPolicy < Api::ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end
end