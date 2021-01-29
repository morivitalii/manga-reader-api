require "rails_helper"

RSpec.describe ResourceTheme do
  describe "validations" do
    subject { create(:resource_theme) }

    it { is_expected.to validate_presence_of(:theme) }
    it { is_expected.to validate_uniqueness_of(:theme).scoped_to(:resource_type, :resource_id) }
  end
end
