require "rails_helper"

RSpec.describe Artist do
  describe "validations" do
    subject { create(:artist) }

    it { is_expected.to validate_uniqueness_of(:user).allow_nil }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(1).is_at_most(64) }
  end
end
