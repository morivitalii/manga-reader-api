class Api::UsersPolicy < Api::ApplicationPolicy
  def index?
    true
  end
end