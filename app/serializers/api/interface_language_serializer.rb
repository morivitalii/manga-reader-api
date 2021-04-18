class Api::InterfaceLanguageSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      title: model.title,
      locale: model.locale.key,
      locale_id: model.locale_id,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end
