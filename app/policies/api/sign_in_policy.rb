class Api::SignInPolicy < Api::ApplicationPolicy
  def create?
    visitor?
  end

  def unauthenticated?
    visitor?
  end
end
