module Search
	module Artist
		extend ActiveSupport::Concern

		included do
			include Elasticsearch::Model

			ELASTICSEARCH_INDEX_SETTINGS = {
				analysis: {
					analyzer: {
						name_analyzer: {
							tokenizer: :name_tokenizer
						}
					},
					tokenizer: {
						name_tokenizer: {
							type: :ngram,
							min_gram: 1,
							max_gram: 2,
							token_chars: [
								:letter,
								:digit
							]
						}
					}
				}
			}

			settings index: ELASTICSEARCH_INDEX_SETTINGS do
				mappings dynamic: false, _source: { enabled: false } do
					indexes :name, type: :text, analyzer: :name_analyzer
				end
			end

			def as_indexed_json(_options = {})
				ActiveRecord::Associations::Preloader.new.preload(
					self, [
						self.class.translations_associations
					]
				)

				{
					name: name_in_all_languages
				}.to_json
			end
		end
	end
end