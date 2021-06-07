class Api::Titles::UpdateVolume
	include ActiveModel::Model

	attr_accessor :volume, :number

	def call
		ActiveRecord::Base.transaction do
			volume.assign_attributes(
				number: number
			)

			volume.save!
		end

		true
	rescue ActiveRecord::RecordInvalid => invalid
		errors.merge!(invalid.record.errors)

		false
	end
end
