module Search
  module Book
    extend ActiveSupport::Concern

    included do
      include Elasticsearch::Model

      settings do
        mappings dynamic: false, _source: { enabled: false } do
          indexes :status, type: :keyword
          indexes :publication_status, type: :keyword
          indexes :created_at, type: :date
          indexes :updated_at, type: :date
          indexes :title, type: :text

          indexes :original_content_language, type: :object do
            indexes :id, type: :keyword
            indexes :locale, type: :keyword
          end

          indexes :published_chapters_content_languages, type: :object do
            indexes :id, type: :keyword
            indexes :locale, type: :keyword
          end

          indexes :artists, type: :object do
            indexes :id, type: :keyword
            indexes :user_id, type: :keyword
            indexes :artist_id, type: :keyword
            indexes :artist_type, type: :keyword
            indexes :name, type: :text
          end

          indexes :tags, type: :object do
            indexes :id, type: :keyword
            indexes :tag_id, type: :keyword
            indexes :artist_id, type: :keyword
            indexes :artist_type, type: :keyword
            indexes :title, type: :text
          end
        end
      end

      def as_indexed_json(_options = {})
        ActiveRecord::Associations::Preloader.new.preload(
          self, [
            self.class.translations_associations,
            original_content_language: [
              :locale,
              ContentLanguage.translations_associations
            ],
            resource_artists: { artist: ::Artist.translations_associations },
            resource_tags: { tag: ::Tag.translations_associations }
          ]
        )

        {
          status: status,
          publication_status: publication_status,
          published_chapters_content_languages: published_chapters_content_languages,
          created_at: created_at,
          updated_at: updated_at,
          title: title_all_locales_values,
          original_content_language: {
            id: original_content_language&.id,
            locale: original_content_language&.locale&.key
          },
          artists: resource_artists.map { |resource_artist|
            {
              id: resource_artist.id,
              user_id: resource_artist.artist.user_id,
              artist_id: resource_artist.artist_id,
              artist_type: resource_artist.type,
              name: resource_artist.artist.name_all_locales_values
            }
          },
          tags: resource_tags.map { |resource_tag|
            {
              id: resource_tag.id,
              tag_id: resource_tag.artist_id,
              tag_type: resource_tag.type,
              title: resource_tag.artist.title_all_locales_values
            }
          }
        }.to_json
      end

      # Content languages that available for readers
      def published_chapters_content_languages
        ContentLanguage.includes(:locale).joins(:chapters).where(
          chapters: {
            status: :published,
            book: self
          }
        ).distinct.all
      end
    end
  end
end