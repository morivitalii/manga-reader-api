class Api::UserSettingSerializer < Api::ApplicationSerializer
  serialize_association :user, with: Api::UserSerializer
  serialize_association :interface_language, with: Api::InterfaceLanguageSerializer

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
      avatar: avatar,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end

  private

  def avatar
    return nil if model.avatar.blank?

    {
      url: model.avatar.url,
      filename: model.avatar.filename,
      content_type: model.avatar.content_type,
      width: model.avatar.metadata[:width],
      height: model.avatar.metadata[:height],
      byte_size: model.avatar.byte_size,
      created_at: model.avatar.created_at
    }
  end
end
