class Api::GroupsPolicy < Api::ApplicationPolicy
  def index?
    true
  end
end