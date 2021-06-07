class Api::Titles::CreateVolume
	include ActiveModel::Model

	attr_accessor :title, :number

	attr_reader :volume

	def call
		ActiveRecord::Base.transaction do
			@volume = Volume.new(
				title: title,
				number: number
			)

			@volume.save!
		end

		true
	rescue ActiveRecord::RecordInvalid => invalid
		errors.merge!(invalid.record.errors)

		false
	end
end
