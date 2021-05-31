class Api::UserSerializer < Api::ApplicationSerializer
  serialize_associations :excluded_tags, with: Api::TagSerializer
  serialize_associations :content_languages, with: Api::ContentLanguageSerializer
  serialize_associations :access_rights, with: Api::AccessRightSerializer

  def attributes
    {
      id: model.id,
      username: model.username,
      name: model.user_setting&.name,
      surname: model.user_setting&.surname,
      avatar: avatar,
      access_rights: access_rights
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
