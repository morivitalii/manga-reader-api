module Search
	module Tag
		extend ActiveSupport::Concern

		included do
			include Elasticsearch::Model

			settings do
				mappings dynamic: false, _source: { enabled: false } do
					indexes :key, type: :keyword
					indexes :books_count, type: :integer

					indexes :title, type: :object do
						indexes :en, type: :text, analyzer: :english
						indexes :ru, type: :text, analyzer: :russian
					end
				end
			end

			def as_indexed_json(_options = {})
				ActiveRecord::Associations::Preloader.new.preload(
					self, [
						self.class.translations_associations
					]
				)

				{
					key: key,
					books_count: books_count,
					title: {
						en: title_en,
						ru: title_ru
					}
				}.to_json
			end

			# Not deleted and published books count
			def books_count
				self.books.where(deleted_at: nil, status: :published).count
			end
		end
	end
end