require "rails_helper"

RSpec.describe ResourceCover do
  describe "validations" do
    subject { create(:resource_cover) }

    it { is_expected.to validate_presence_of(:cover) }
    it { is_expected.to validate_uniqueness_of(:cover).scoped_to(:resource_type, :resource_id) }
  end
end
