class Api::GroupUserSerializer < Api::ApplicationSerializer
  serialize_association :group, with: Api::GroupSerializer
  serialize_association :user, with: Api::UserSerializer

  def attributes
    {
      id: model.id,
      group: group,
      user: user,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end
