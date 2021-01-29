require "rails_helper"

RSpec.describe ResourceGenre do
  describe "validations" do
    subject { create(:resource_genre) }

    it { is_expected.to validate_presence_of(:genre) }
    it { is_expected.to validate_uniqueness_of(:genre).scoped_to(:resource_type, :resource_id) }
  end
end
