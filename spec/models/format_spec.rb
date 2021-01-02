require "rails_helper"

RSpec.describe Format do
  describe "validations" do
    subject { create(:format) }

    it { is_expected.to validate_uniqueness_of(:tag) }
  end
end
