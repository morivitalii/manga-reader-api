class Search::Indexing::CreateObject
	include ActiveModel::Model

	attr_accessor :class_name, :id

	def call
		klass = class_name.classify.constantize
		model = klass.find(id)

		model.__elasticsearch__.index_document
	end
end