require "rails_helper"

RSpec.describe ResourceWriter do
  describe "validations" do
    subject { create(:resource_writer) }

    it { is_expected.to validate_presence_of(:writer) }
    it { is_expected.to validate_uniqueness_of(:writer).scoped_to(:resource_type, :resource_id) }
  end
end
