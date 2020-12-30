require "rails_helper"

RSpec.describe Theme do
  describe "validations" do
    subject { create(:theme) }

    it { is_expected.to validate_uniqueness_of(:tag) }
  end
end