class Api::ApplicationPolicy
  def initialize(user, record = nil)
    @user = user
    @record = record
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end

  private

  attr_reader :user, :record

  def visitor?
    !user?
  end

  def user?
    user.present?
  end
end