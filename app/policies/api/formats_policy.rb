class Api::FormatsPolicy < Api::ApplicationPolicy
  def index?
    true
  end
end