class Api::DemographicsPolicy < Api::ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end
end