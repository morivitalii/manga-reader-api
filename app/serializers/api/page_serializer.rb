class Api::PageSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      chapter_id: model.chapter_id,
      cleaner_id: model.cleaner_id,
      translator_id: model.translator_id,
      editor_id: model.editor_id,
      typer_id: model.typer_id,
      number: model.number,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end
