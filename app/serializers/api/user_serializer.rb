class Api::UserSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      username: model.username,
      name: model.user_setting&.name,
      surname: model.user_setting&.surname,
      created_at: model.created_at,
      avatar: avatar
    }
  end

  private

  def avatar
    return nil if model.user_setting.blank?
    return nil if model.user_setting.avatar.blank?

    {
      url: model.user_setting.avatar.url,
      content_type: model.user_setting.avatar.content_type,
      width: model.user_setting.avatar.metadata[:width],
      height: model.user_setting.avatar.metadata[:height]
    }
  end
end
