require "rails_helper"

RSpec.describe Group do
  describe "validations" do
    subject { create(:group) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(1).is_at_most(50) }
  end
end
