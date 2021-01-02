require "rails_helper"

RSpec.describe Demographic do
  describe "validations" do
    subject { create(:demographic) }

    it { is_expected.to validate_uniqueness_of(:tag) }
  end
end
