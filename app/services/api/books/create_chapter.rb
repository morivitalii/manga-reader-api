class Api::Books::CreateChapter
  include ActiveModel::Model

  attr_accessor :book, :user, :content_language_id, :group_id, :volume_id, :name, :number,
    :cleaner_ids, :translator_ids, :editor_ids, :typer_ids

  attr_reader :chapter

  def call
    ActiveRecord::Base.transaction do
      @chapter = Chapter.new(
        name: name,
        status: :draft,
        number: number,
        book: book,
        user: user,
        content_language_id: content_language_id,
        group_id: group_id,
        volume_id: volume_id
      )

      process_resource_artists(:cleaner, cleaner_ids)
      process_resource_artists(:translator, translator_ids)
      process_resource_artists(:editor, editor_ids)
      process_resource_artists(:typer, typer_ids)

      @chapter.save!
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end

  private

  def process_resource_artists(type, artist_ids)
    artist_ids.each do |artist_id|
      @chapter.resource_artists.build(
        artist_id: artist_id,
        artist_type: type
      )
    end
  end
end
