require "rails_helper"

RSpec.describe Genre do
  describe "validations" do
    subject { create(:genre) }

    it { is_expected.to validate_uniqueness_of(:tag) }
  end
end