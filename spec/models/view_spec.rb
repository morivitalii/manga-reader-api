require "rails_helper"

RSpec.describe View do
  describe "validations" do
    subject { create(:view) }

    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:resource) }
    it { is_expected.to validate_uniqueness_of(:user).scoped_to(:resource_type, :resource_id) }
  end
end
