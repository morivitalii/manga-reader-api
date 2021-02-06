require "rails_helper"

RSpec.describe Tag do
  describe "validations" do
    subject { create(:tag) }

    it { is_expected.to validate_uniqueness_of(:key) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(1).is_at_most(25) }
    it { is_expected.to validate_length_of(:description).is_at_least(1).is_at_most(1_000).allow_blank }
  end
end
