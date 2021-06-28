module Search
  module Book
    extend ActiveSupport::Concern

    included do
      include Elasticsearch::Model

      settings do
        mappings dynamic: false, _source: { enabled: false } do
          indexes :title, type: :text
          indexes :status, type: :keyword
          indexes :publication_status, type: :keyword
          indexes :original_content_language, type: :long

          indexes :artists, type: :object do
            indexes :id, type: :keyword
            indexes :name, type: :text
          end

          indexes :tags, type: :object do
            indexes :id, type: :keyword
            indexes :title, type: :text
          end

          indexes :created_at, type: :date
          indexes :updated_at, type: :date
        end
      end

      def as_indexed_json(_options = {})
        ActiveRecord::Associations::Preloader.new.preload(
          self, [
            self.class.translations_associations,
            artists: ::Artist.translations_associations,
            tags: ::Tag.translations_associations
          ]
        )

        {
          title: title_in_all_languages,
          status: status,
          publication_status: publication_status,
          original_content_language: original_content_language_id,
          artists: artists_as_indexed_json,
          tags:tags_as_indexed_json,
          created_at: created_at,
          updated_at: updated_at
        }.to_json
      end

      def artists_as_indexed_json
        artists.map { |artist|
          {
            id: artist.id,
            name: artist.name_in_all_languages
          }
        }
      end

      def tags_as_indexed_json
        tags.map { |tag|
          {
            id: tag.id,
            title: tag.title_in_all_languages
          }
        }
      end
    end
  end
end