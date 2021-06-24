class Search::Reindex::Single
	include ActiveModel::Model

	attr_accessor :class_name, :id

	def call
		model = class_name.classify.constantize.find(id)

		model.__elasticsearch__.index_document
	end
end