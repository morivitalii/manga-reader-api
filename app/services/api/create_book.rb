class Api::CreateBook
  include ActiveModel::Model

  attr_accessor :title, :description, :publication_status, :original_content_language_id, :writer_ids, :painter_ids,
    :genre_ids, :format_ids, :demographic_ids, :mark_ids, :theme_ids

  attr_reader :book

  def call
    ActiveRecord::Base.transaction do
      @book = Book.new(
        title: title,
        description: description,
        status: :draft,
        publication_status: publication_status,
        original_content_language_id: original_content_language_id,
      )

      process_resource_artists(:writer, writer_ids)
      process_resource_artists(:painter, painter_ids)

      process_resource_tags(:mark, mark_ids)
      process_resource_tags(:theme, theme_ids)
      process_resource_tags(:genre, genre_ids)
      process_resource_tags(:format, format_ids)
      process_resource_tags(:demographic, demographic_ids)

      @book.save!

      # To know if we need to update object in elasticsearch,
      # please take a look for attributes and associations in index schema
      Search::Indexing::CreateObjectWorker.perform_async(@book.class.name, @book.id)
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end

  private

  def process_resource_artists(type, artist_ids)
    artist_ids.each do |artist_id|
      @book.resource_artists.build(
        artist_id: artist_id,
        artist_type: type
      )
    end
  end

  def process_resource_tags(type, tag_ids)
    tag_ids.each do |artist_id|
      @book.resource_tags.build(
        tag_id: artist_id,
        tag_type: type
      )
    end
  end
end
