class Search::Indexing::UpdateObjectAssociations
	include ActiveModel::Model

	attr_accessor :id, :class_name, :associations

	def call
		klass = class_name.classify.constantize
		model = klass.find(id)

		associations.each do |association|
			model.association(association).scope.find_each do |instance|
				Search::Indexing::UpdateObjectWorker.perform_async(instance.class.name, instance.id)
			end
		end
	end
end