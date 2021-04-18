class Api::GroupUserSerializer < Api::ApplicationSerializer
  serialize_association :group, with: Api::GroupSerializer
  serialize_association :user, with: Api::UserSerializer
  serialize_associations :group_access_rights, with: Api::GroupAccessRightSerializer

  def attributes
    {
      id: model.id,
      group_id: model.group_id,
      user_id: model.user_id,
      group_access_rights: group_access_rights,
      group: group,
      user: user,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end
