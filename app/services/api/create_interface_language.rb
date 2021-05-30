class Api::CreateInterfaceLanguage
	include ActiveModel::Model

	attr_accessor :locale_id, :title

	attr_reader :interface_language

	def call
		ActiveRecord::Base.transaction do
			@interface_language = InterfaceLanguage.new(
				locale_id: locale_id,
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
