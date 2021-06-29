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
          indexes :artist_ids, type: :long
          indexes :tag_ids, type: :long
          indexes :created_at, type: :date
          indexes :updated_at, type: :date
        end
      end

      def as_indexed_json(_options = {})
        ActiveRecord::Associations::Preloader.new.preload(
          self, [
            self.class.translations_associations
          ]
        )

        {
          title: title_in_all_languages,
          status: status,
          publication_status: publication_status,
          artist_ids: artist_ids,
          tag_ids: tag_ids,
          created_at: created_at,
          updated_at: updated_at
        }.to_json
      end
    end
  end
end