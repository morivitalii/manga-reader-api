class Api::Titles::UpdateChapter
  include ActiveModel::Model

  attr_accessor :chapter, :content_language_id, :volume_id, :name, :number, :cleaner_ids, :translator_ids, :editor_ids, :typer_ids

  def call
    ActiveRecord::Base.transaction do
      chapter.assign_attributes(
        name: name,
        number: number,
        content_language_id: content_language_id,
        volume_id: volume_id
      )

      process_resource_artists(:cleaner, cleaner_ids)
      process_resource_artists(:translator, translator_ids)
      process_resource_artists(:editor, editor_ids)
      process_resource_artists(:typer, typer_ids)

      chapter.save!
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end

  private

  def process_resource_artists(type, artist_ids)
    chapter.resource_artists.each do |resource_artist|
      next unless artist_marked_for_destroy?(resource_artist, type, artist_ids)

      resource_artist.destroy!
    end

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
