require "rails_helper"

RSpec.describe ResourceTranslator do
  describe "validations" do
    subject { create(:resource_translator) }

    it { is_expected.to validate_presence_of(:translator) }
    it { is_expected.to validate_uniqueness_of(:translator).scoped_to(:resource_type, :resource_id) }
  end
end
