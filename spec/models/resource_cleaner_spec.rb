require "rails_helper"

RSpec.describe ResourceCleaner do
  describe "validations" do
    subject { create(:resource_cleaner) }

    it { is_expected.to validate_presence_of(:cleaner) }
    it { is_expected.to validate_uniqueness_of(:cleaner).scoped_to(:resource_type, :resource_id) }
  end
end
