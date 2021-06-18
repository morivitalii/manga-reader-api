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
				original_content_language_id: original_content_language_id
			)

			process_resource_artists(:writer, writer_ids)
			process_resource_artists(:painter, painter_ids)

			process_resource_tags(:mark, mark_ids)
			process_resource_tags(:theme, theme_ids)
			process_resource_tags(:genre, genre_ids)
			process_resource_tags(:format, format_ids)
			process_resource_tags(:demographic, demographic_ids)

			title_object.save!
		end

		true
	rescue ActiveRecord::RecordInvalid => invalid
		errors.merge!(invalid.record.errors)

		false
	end

	private

	def process_resource_artists(type, artist_ids)
		destroy_artists(type, artist_ids)
		create_artists(type, artist_ids)
	end

	def destroy_artists(type, artist_ids)
		title_object.resource_artists.each do |resource_artist|
			next unless artist_marked_for_destroy?(resource_artist, type, artist_ids)

			resource_artist.destroy!
		end
	end

	def create_artists(type, artist_ids)
		artist_ids.each do |artist_id|
			next if artist_attached?(type, artist_id)


			title_object.resource_artists.build(
				artist_id: artist_id,
				artist_type: type
			)
		end
	end

	def artist_attached?(type, artist_id)
		title_object.resource_artists.any? do |resource_artist|
			type_matches = resource_artist.public_send("#{type}?")
			artist_id_equal = resource_artist.artist_id == artist_id

			type_matches && artist_id_equal
		end
	end

	def artist_marked_for_destroy?(resource_artist, type, artist_ids)
		type_matches = resource_artist.public_send("#{type}?")
		id_absent_in_artist_ids = artist_ids.exclude?(resource_artist.artist_id)

		type_matches && id_absent_in_artist_ids
	end

	def process_resource_tags(type, tag_ids)
		destroy_tags(type, tag_ids)
		create_tags(type, tag_ids)
	end

	def destroy_tags(type, tag_ids)
		title_object.resource_tags.each do |resource_tag|
			next unless tag_marked_for_destroy?(resource_tag, type, tag_ids)

			resource_tag.destroy!
		end
	end

	def create_tags(type, tag_ids)
		tag_ids.each do |tag_id|
			next if tag_attached?(type, tag_id)

			tag = title_object.resource_tags.build(
				tag_id: tag_id,
				tag_type: type
			)

			tag.valid?
		end
	end

	def tag_attached?(type, tag_id)
		title_object.resource_tags.any? do |resource_tag|
			type_matches = resource_tag.public_send("#{type}?")
			tag_id_equal = resource_tag.tag_id == tag_id

			type_matches && tag_id_equal
		end
	end

	def tag_marked_for_destroy?(resource_tag, type, tag_ids)
		type_matches = resource_tag.public_send("#{type}?")
		id_absent_in_tag_ids = tag_ids.exclude?(resource_tag.tag_id)

		type_matches && id_absent_in_tag_ids
	end
end