require "rails_helper"

RSpec.describe Writer do
  describe "validations" do
    subject { create(:writer) }

    it { is_expected.to validate_uniqueness_of(:artist) }
  end
end
