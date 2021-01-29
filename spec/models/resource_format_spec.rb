require "rails_helper"

RSpec.describe ResourceFormat do
  describe "validations" do
    subject { create(:resource_format) }

    it { is_expected.to validate_presence_of(:format) }
    it { is_expected.to validate_uniqueness_of(:format).scoped_to(:resource_type, :resource_id) }
  end
end
