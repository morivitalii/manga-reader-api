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
      next unless resource_artist.public_send("#{type}?")
      next if artist_ids.include?(resource_artist.artist_id)

      resource_artist.destroy!
    end

    artist_ids.each do |artist_id|
      next if chapter.resource_artists.any? { |resource_artist| resource_artist.public_send("#{type}?") && resource_artist.artist_id == artist_id }

      chapter.resource_artists.build(
        artist_id: artist_id,
        artist_type: type
      )
    end
  end
end
