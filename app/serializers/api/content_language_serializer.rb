class Api::ContentLanguageSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      locale_id: model.locale_id,
      title: model.title
    }
  end
end
