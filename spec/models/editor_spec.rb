require "rails_helper"

RSpec.describe Editor do
  describe "validations" do
    subject { create(:editor) }

    it { is_expected.to validate_uniqueness_of(:artist) }
  end
end
