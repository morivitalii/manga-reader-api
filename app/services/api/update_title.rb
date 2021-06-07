class Api::UpdateTitle
	include ActiveModel::Model

	attr_accessor :title_object, :title, :description, :publication_status, :original_content_language_id, :writer_ids, :painter_ids,
								:genre_ids, :format_ids, :demographic_ids, :mark_ids, :theme_ids

	def call
		title_object.assign_attributes(
			title: title,
			description: description,
			publication_status: publication_status,
			original_content_language_id: original_content_language_id,
			writer_ids: writer_ids,
			painter_ids: painter_ids,
			genre_ids: genre_ids,
			format_ids: format_ids,
			demographic_ids: demographic_ids,
			mark_ids: mark_ids,
			theme_ids: theme_ids
		)

		title_object.save!

		true
	rescue ActiveRecord::RecordInvalid => invalid
		errors.merge!(invalid.record.errors)

		false
	end
end