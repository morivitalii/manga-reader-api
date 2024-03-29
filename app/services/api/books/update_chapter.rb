class Api::Books::UpdateChapter
  include ActiveModel::Model

  attr_accessor :chapter, :content_language_id, :volume, :title, :number, :cleaner_ids, :translator_ids, :editor_ids, :typer_ids

  def call
    ActiveRecord::Base.transaction do
      chapter.assign_attributes(
        title: title,
        number: number,
        content_language_id: content_language_id,
        volume: volume
      )

      process_resource_artists(:cleaner, cleaner_ids)
      process_resource_artists(:translator, translator_ids)
      process_resource_artists(:editor, editor_ids)
      process_resource_artists(:typer, typer_ids)

      chapter.save!

      # To know if we need to update object in elasticsearch,
      # please take a look for attributes and associations in index schema
      Search::Indexing::UpdateObjectWorker.perform_async(chapter.class.name, chapter.id)
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end

  private

  def process_resource_artists(type, artist_ids)
    destroy_artists(type, artist_ids)
    create_artists(type, artist_ids)
  end

  def destroy_artists(type, artist_ids)
    chapter.resource_artists.each do |resource_artist|
      next unless artist_marked_for_destroy?(resource_artist, type, artist_ids)

      resource_artist.destroy!
    end
  end

  def create_artists(type, artist_ids)
    artist_ids.each do |artist_id|
      next if artist_attached?(type, artist_id)

      chapter.resource_artists.build(
        artist_id: artist_id,
        artist_type: type
      )
    end
  end

  def artist_attached?(type, artist_id)
    chapter.resource_artists.any? do |resource_artist|
      type_matches = resource_artist.public_send("#{type}?")
      artist_id_equal = resource_artist.artist_id == artist_id

      type_matches && artist_id_equal
    end
  end

  def artist_marked_for_destroy?(resource_artist, type, artist_ids)
    type_matches = resource_artist.public_send("#{type}?")
    id_absent_in_artist_ids = artist_ids.exclude?(resource_artist.artist_id)

    type_matches && id_absent_in_artist_ids
  end
end
