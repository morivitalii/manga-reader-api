class Api::ResourceTagSerializer < Api::ApplicationSerializer
	serialize_association :tag, with: Api::TagSerializer

	def attributes
		{
			id: model.id,
			tag_id: model.tag_id,
			tag_type: model.tag_type,
			resource_id: model.resource_id,
			resource_type: model.resource_type,
			tag: tag
		}
	end
end
