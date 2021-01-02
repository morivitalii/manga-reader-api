class Api::DemographicsPolicy < Api::ApplicationPolicy
  def index?
    true
  end
end