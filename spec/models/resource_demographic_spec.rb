require "rails_helper"

RSpec.describe ResourceDemographic do
  describe "validations" do
    subject { create(:resource_demographic) }

    it { is_expected.to validate_presence_of(:demographic) }
    it { is_expected.to validate_uniqueness_of(:demographic).scoped_to(:resource_type, :resource_id) }
  end
end
