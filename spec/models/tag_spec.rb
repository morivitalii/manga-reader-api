require "rails_helper"

RSpec.describe Tag do
  describe "validations" do
    subject { create(:tag) }

    it { is_expected.to validate_uniqueness_of(:key).case_insensitive }
    it { is_expected.to validate_presence_of(:title) }
  end
end