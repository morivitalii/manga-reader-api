class Api::CreateTitle
  include ActiveModel::Model

  attr_accessor :title, :description, :publication_status, :original_content_language_id, :writer_ids, :painter_ids,
    :genre_ids, :format_ids, :demographic_ids, :mark_ids, :theme_ids

  attr_reader :title_object

  def call
    ActiveRecord::Base.transaction do
      @title_object = Title.new(
        title: title,
        description: description,
        status: :draft,
        publication_status: publication_status,
        original_content_language_id: original_content_language_id,
        genre_ids: genre_ids,
        format_ids: format_ids,
        demographic_ids: demographic_ids,
        mark_ids: mark_ids,
        theme_ids: theme_ids
      )

      process_resource_artists(:writer, writer_ids)
      process_resource_artists(:painter, painter_ids)

      @title_object.save!
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end

  private

  def process_resource_artists(type, artist_ids)
    artist_ids.each do |artist_id|
      @title_object.resource_artists.build(
        artist_id: artist_id,
        artist_type: type
      )
    end
  end
end
