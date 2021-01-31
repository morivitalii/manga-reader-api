require "rails_helper"

RSpec.describe ResourceEditor do
  describe "validations" do
    subject { create(:resource_editor) }

    it { is_expected.to validate_presence_of(:editor) }
    it { is_expected.to validate_uniqueness_of(:editor).scoped_to(:resource_type, :resource_id) }
  end
end
