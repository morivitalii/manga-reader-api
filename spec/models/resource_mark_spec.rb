require "rails_helper"

RSpec.describe ResourceMark do
  describe "validations" do
    subject { create(:resource_mark) }

    it { is_expected.to validate_presence_of(:mark) }
    it { is_expected.to validate_uniqueness_of(:mark).scoped_to(:resource_type, :resource_id) }
  end
end
