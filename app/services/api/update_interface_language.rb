class Api::UpdateInterfaceLanguage
	include ActiveModel::Model

	attr_accessor :interface_language, :title

	def call
		ActiveRecord::Base.transaction do
			interface_language.assign_attributes(
				title: title
			)

			interface_language.save!
		end

		true
	rescue ActiveRecord::RecordInvalid => invalid
		errors.merge!(invalid.record.errors)

		false
	end
end