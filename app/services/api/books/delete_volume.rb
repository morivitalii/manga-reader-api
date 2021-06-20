class Api::Books::DeleteVolume
	include ActiveModel::Model

	attr_accessor :volume

	def call
		ActiveRecord::Base.transaction do
			volume.destroy!
		end

		true
	rescue ActiveRecord::RecordInvalid => invalid
		errors.merge!(invalid.record.errors)

		false
	end
end
