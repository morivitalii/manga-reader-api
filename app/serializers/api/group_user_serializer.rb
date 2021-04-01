class Api::GroupUserSerializer < Api::ApplicationSerializer
  serialize_association :group, with: Api::GroupSerializer
  serialize_association :user, with: Api::UserSerializer

  def attributes
    {
      id: model.id,
      group_id: model.group_id,
      user_id: model.user_id,
      access_rights: access_rights,
      group: group,
      user: user,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end

  private

  def access_rights
    @access_rights ||= model.group_access_rights.map(&:key)
  end
end
