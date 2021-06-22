class Api::CreateInterfaceLanguage
	include ActiveModel::Model

	attr_accessor :locale_id, :title

	attr_reader :interface_language

	def call
		ActiveRecord::Base.transaction do
			@interface_language = InterfaceLanguage.create!(
				locale_id: locale_id,
				title: title
			)
		end

		true
	rescue ActiveRecord::RecordInvalid => invalid
		errors.merge!(invalid.record.errors)

		false
	end
end
