class LocaleSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      key: model.key,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end
