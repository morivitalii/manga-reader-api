class Api::DeleteInterfaceLanguage
	include ActiveModel::Model

	attr_accessor :interface_language

	def call
		ActiveRecord::Base.transaction do
			interface_language.destroy!
		end

		true
	rescue ActiveRecord::RecordInvalid => invalid
		errors.merge!(invalid.record.errors)

		false
	end
end
