require "rails_helper"

RSpec.describe ResourceArtist do
	describe "validations" do
		subject { create(:resource_artist) }

		it { is_expected.to validate_uniqueness_of(:artist).scoped_to(:artist_type, :resource_type, :resource_id) }
		it { is_expected.to validate_presence_of(:artist_type) }
	end
end
