class Api::VolumeSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      book_id: model.book_id,
      number: model.number
    }
  end
end
