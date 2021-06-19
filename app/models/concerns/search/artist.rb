module Search
	module Artist
		extend ActiveSupport::Concern

		included do
			include Elasticsearch::Model

			settings do
				mappings dynamic: false, _source: { enabled: false } do
					indexes :created_at, type: :date
					indexes :updated_at, type: :date

					indexes :name, type: :object do
						indexes :en, type: :text, analyzer: :english
						indexes :ru, type: :text, analyzer: :russian
					end
				end
			end

			def as_indexed_json(options = {})
				ActiveRecord::Associations::Preloader.new.preload(
					self, [
						self.class.translations_associations
					]
				)

				{
					created_at: created_at,
					updated_at: updated_at,
					name: {
						en: name_en,
						ru: name_ru
					}
				}.to_json
			end
		end
	end
end