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
      sex: model.user_setting&.sex,
      avatar: avatar,
      access_rights: access_rights,
      favorites_count: model.favorites_count,
      bookmarks_count: model.bookmarks_count,
      views_count: model.views_count,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end

  private

  def avatar
    return nil if model.user_setting.blank?
    return nil if model.user_setting.avatar.blank?

    {
      url: model.user_setting.avatar.url,
      filename: model.user_setting.avatar.filename,
      content_type: model.user_setting.avatar.content_type,
      width: model.user_setting.avatar.metadata[:width],
      height: model.user_setting.avatar.metadata[:height],
      byte_size: model.user_setting.avatar.byte_size,
      created_at: model.user_setting.avatar.created_at
    }
  end
end
