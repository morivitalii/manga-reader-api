require "rails_helper"

RSpec.describe GroupAccessRight do
  describe "validations" do
    subject { create(:group_access_right) }

    it { is_expected.to validate_presence_of(:key) }
    it { is_expected.to validate_uniqueness_of(:key).ignoring_case_sensitivity }
  end
end
