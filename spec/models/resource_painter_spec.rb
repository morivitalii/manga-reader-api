require "rails_helper"

RSpec.describe ResourcePainter do
  describe "validations" do
    subject { create(:resource_painter) }

    it { is_expected.to validate_presence_of(:painter) }
    it { is_expected.to validate_uniqueness_of(:painter).scoped_to(:resource_type, :resource_id) }
  end
end
