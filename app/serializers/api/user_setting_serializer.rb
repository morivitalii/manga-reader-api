class Api::UserSettingSerializer < Api::ApplicationSerializer
  serialize_association :user, with: Api::UserSerializer
  serialize_association :interface_language, with: Api::InterfaceLanguageSerializer
  serialize_association :access_rights, with: Api::AccessRightSerializer

  def attributes
    {
      id: model.id,
      user_id: model.user_id,
      interface_language_id: model.interface_language_id,
      name: model.name,
      surname: model.surname,
      sex: model.sex,
      interface_language: interface_language,
      excluded_tags: user.excluded_tags,
      content_languages: user.content_languages,
      access_rights: access_rights,
      avatar: avatar
    }
  end

  private

  def avatar
    return nil if model.avatar.blank?

    {
      url: model.avatar.url,
      content_type: model.avatar.content_type,
      width: model.avatar.metadata[:width],
      height: model.avatar.metadata[:height]
    }
  end
end
