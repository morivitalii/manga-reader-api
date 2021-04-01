module Api::GroupAccessRights
  extend ActiveSupport::Concern

  private

  def user_have_group_access_right?(group, access_right)
    Group.joins(
      group_users: {
        group_user_access_rights: :group_access_right
      }
    ).where(
      group_users: {
        group: group,
        user: user
      },
      group_access_rights: {
        key: access_right
      }
    ).exists?
  end
end
