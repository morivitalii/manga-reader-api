class Api::FormatsPolicy < Api::ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end
end