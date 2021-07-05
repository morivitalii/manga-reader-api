module Search
	module Tag
		extend ActiveSupport::Concern

		included do
			include Elasticsearch::Model

			ELASTICSEARCH_INDEX_SETTINGS = {
				analysis: {
					analyzer: {
						title_analyzer: {
							tokenizer: :title_tokenizer
						}
					},
					tokenizer: {
						title_tokenizer: {
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
					indexes :title, type: :text, analyzer: :title_analyzer
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
					title: title_in_all_languages
				}.to_json
			end
		end
	end
end