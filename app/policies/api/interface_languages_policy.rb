class Api::InterfaceLanguagesPolicy < Api::ApplicationPolicy
  def index?
    true
  end
end