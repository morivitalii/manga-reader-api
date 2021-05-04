class Api::ApplicationPolicy
  # Current user
  # Can contain user object or nil
  attr_reader :user

  # Additional variables passed to specific policy
  attr_reader :options

  def initialize(user, options = {})
    @user = user
    @options = options.present? ? Struct.new(*options.keys).new(*options.values) : nil
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

  # Method to check if user has specified access right in group
  def group_access_right?(group, key)
    group_access_rights(group).any? { |access_right| access_right.key == key.to_s }
  end

  # Method to checkout if user has specified access right
  def access_right?(key)
    access_rights.any? { |access_right| access_right.key == key.to_s }
  end

  # Method to check if user is signed out
  def visitor?
    !user?
  end

  # Method to check if user signed in
  def user?
    user.present?
  end

  private

  # User access rights
  def access_rights
    @access_rights ||= user.access_rights
  end

  # User access rights in groups
  def group_access_rights(group)
    @group_access_rights ||= {}

    return @group_access_rights[group.id] if @group_access_rights.include?(group.id)

    @group_access_rights[group.id] = GroupAccessRight.joins(:group_users).where(group_users: { group: group, user: user }).all

    @group_access_rights[group.id]
  end
end