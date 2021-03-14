module Search
  module Title
    extend ActiveSupport::Concern

    included do
      include Elasticsearch::Model

      settings do
        mappings dynamic: false, _source: { enabled: false } do
          indexes :status, type: :keyword
          indexes :publication_status, type: :keyword
          indexes :created_at, type: :date
          indexes :updated_at, type: :date

          indexes :title, type: :object do
            indexes :en, type: :text, analyzer: :english
            indexes :ru, type: :text, analyzer: :russian
          end

          indexes :original_content_language, type: :object do
            indexes :id, type: :keyword
            indexes :locale, type: :keyword
          end

          indexes :published_chapters_content_languages, type: :object do
            indexes :id, type: :keyword
            indexes :locale, type: :keyword
          end

          indexes :writers, type: :object do
            indexes :id, type: :keyword
            indexes :user_id, type: :keyword
            indexes :artist_id, type: :keyword

            indexes :name, type: :object do
              indexes :en, type: :text, analyzer: :english
              indexes :ru, type: :text, analyzer: :russian
            end
          end

          indexes :painters, type: :object do
            indexes :id, type: :keyword
            indexes :user_id, type: :keyword
            indexes :artist_id, type: :keyword

            indexes :name, type: :object do
              indexes :en, type: :text, analyzer: :english
              indexes :ru, type: :text, analyzer: :russian
            end
          end

          indexes :genres, type: :object do
            indexes :id, type: :keyword
            indexes :tag_id, type: :keyword

            indexes :title, type: :object do
              indexes :en, type: :text, analyzer: :english
              indexes :ru, type: :text, analyzer: :russian
            end
          end

          indexes :formats, type: :object do
            indexes :id, type: :keyword
            indexes :tag_id, type: :keyword

            indexes :title, type: :object do
              indexes :en, type: :text, analyzer: :english
              indexes :ru, type: :text, analyzer: :russian
            end
          end

          indexes :demographics, type: :object do
            indexes :id, type: :keyword
            indexes :tag_id, type: :keyword

            indexes :title, type: :object do
              indexes :en, type: :text, analyzer: :english
              indexes :ru, type: :text, analyzer: :russian
            end
          end

          indexes :marks, type: :object do
            indexes :id, type: :keyword
            indexes :tag_id, type: :keyword

            indexes :title, type: :object do
              indexes :en, type: :text, analyzer: :english
              indexes :ru, type: :text, analyzer: :russian
            end
          end

          indexes :themes, type: :object do
            indexes :id, type: :keyword
            indexes :tag_id, type: :keyword

            indexes :title, type: :object do
              indexes :en, type: :text, analyzer: :english
              indexes :ru, type: :text, analyzer: :russian
            end
          end
        end
      end

      def as_indexed_json(options = {})
        ActiveRecord::Associations::Preloader.new.preload(
          self, [
            self.class.translations_associations,
            original_content_language: [
              :locale,
              ContentLanguage.translations_associations
            ],
            writers: { artist: Artist.translations_associations },
            painters: { artist: Artist.translations_associations },
            genres: { tag: Tag.translations_associations },
            formats: { tag: Tag.translations_associations },
            demographics: { tag: Tag.translations_associations },
            marks: { tag: Tag.translations_associations },
            themes: { tag: Tag.translations_associations }
          ]
        )

        {
          status: status,
          publication_status: publication_status,
          published_chapters_content_languages: published_chapters_content_languages,
          created_at: created_at,
          updated_at: updated_at,
          title: {
            en: title_en,
            ru: title_ru
          },
          original_content_language: {
            id: original_content_language.id,
            locale: original_content_language.locale.key
          },
          writers: writers.map { |writer|
            {
              id: writer.id,
              user_id: writer.artist.user_id,
              artist_id: writer.artist_id,
              name: {
                en: writer.artist.name_en,
                ru: writer.artist.name_ru
              }
            }
          },
          painters: painters.map { |painter|
            {
              id: painter.id,
              user_id: painter.artist.user_id,
              artist_id: painter.artist_id,
              name: {
                en: painter.artist.name_en,
                ru: painter.artist.name_ru
              }
            }
          },
          genres: genres.map { |genre|
            {
              id: genre.id,
              tag_id: genre.tag_id,
              title: {
                en: genre.tag.title_en,
                ru: genre.tag.title_ru
              }
            }
          },
          formats: formats.map { |format|
            {
              id: format.id,
              tag_id: format.tag_id,
              title: {
                en: format.tag.title_en,
                ru: format.tag.title_ru
              }
            }
          },
          demographics: demographics.map { |demographic|
            {
              id: demographic.id,
              tag_id: demographic.tag_id,
              title: {
                en: demographic.tag.title_en,
                ru: demographic.tag.title_ru
              }
            }
          },
          marks: marks.map { |mark|
            {
              id: mark.id,
              tag_id: mark.tag_id,
              title: {
                en: mark.tag.title_en,
                ru: mark.tag.title_ru
              }
            }
          },
          themes: themes.map { |theme|
            {
              id: theme.id,
              tag_id: theme.tag_id,
              title: {
                en: theme.tag.title_en,
                ru: theme.tag.title_ru
              }
            }
          }
        }.to_json
      end

      def published_chapters_content_languages
        ContentLanguage.includes(:locale).joins(:chapters).where(
          chapters: {
            status: :published,
            title: self
          }
        ).distinct.all
      end
    end
  end
end