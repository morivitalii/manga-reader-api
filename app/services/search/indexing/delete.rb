class Search::Indexing::Delete
	include ActiveModel::Model

	attr_accessor :class_name, :id

	def call
		klass = class_name.classify.constantize
		index = klass.index_name
		type = klass.document_type

		klass.__elasticsearch__.client.delete(
			id: id,
			index: index,
			type: type,
		)
	end
end