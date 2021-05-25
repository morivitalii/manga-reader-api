class Api::AccessRightSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      key: model.key
    }
  end
end
