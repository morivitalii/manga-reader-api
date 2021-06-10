class Api::UpdateTitle
	include ActiveModel::Model

	attr_accessor :title_object, :title, :description, :publication_status, :original_content_language_id,
								:writer_ids, :painter_ids, :genre_ids, :format_ids, :demographic_ids, :mark_ids, :theme_ids

	def call
		ActiveRecord::Base.transaction do
			title_object.assign_attributes(
				title: title,
				description: description,
				publication_status: publication_status,
				original_content_language_id: original_content_language_id,
				genre_ids: genre_ids,
				format_ids: format_ids,
				demographic_ids: demographic_ids,
				mark_ids: mark_ids,
				theme_ids: theme_ids
			)

			process_resource_artists(:writer, writer_ids)
			process_resource_artists(:painter, painter_ids)

			title_object.save!
		end

		true
	rescue ActiveRecord::RecordInvalid => invalid
		errors.merge!(invalid.record.errors)

		false
	end

	private

	def process_resource_artists(type, artist_ids)
		title_object.resource_artists.each do |resource_artist|
			next unless resource_artist.public_send("#{type}?")
			next if artist_ids.include?(resource_artist.artist_id)

			resource_artist.destroy!
		end

		artist_ids.each do |artist_id|
			next if title_object.resource_artists.any? { |resource_artist| resource_artist.public_send("#{type}?") && resource_artist.artist_id == artist_id }

			title_object.resource_artists.build(
				artist_id: artist_id,
				artist_type: type
			)
		end
	end
end