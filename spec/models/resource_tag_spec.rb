require "rails_helper"

RSpec.describe ResourceTag do
  describe "validations" do
    subject { create(:resource_tag) }

    it { is_expected.to validate_uniqueness_of(:tag).scoped_to(:resource_type, :resource_id) }
  end
end