class Api::SignOutPolicy < Api::ApplicationPolicy
  def destroy?
    user?
  end
end
