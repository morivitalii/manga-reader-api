class Search::Indexing::UpdateObject
	include ActiveModel::Model

	attr_accessor :class_name, :id

	def call
		klass = class_name.classify.constantize
		model = klass.find(id)

		model.__elasticsearch__.update_document
	end
end