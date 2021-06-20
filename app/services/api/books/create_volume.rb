class Api::Books::CreateVolume
	include ActiveModel::Model

	attr_accessor :book, :number

	attr_reader :volume

	def call
		ActiveRecord::Base.transaction do
			@volume = Volume.new(
				book: book,
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
