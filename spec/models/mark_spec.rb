require "rails_helper"

RSpec.describe Mark do
  describe "validations" do
    subject { create(:mark) }

    it { is_expected.to validate_uniqueness_of(:tag) }
  end
end
