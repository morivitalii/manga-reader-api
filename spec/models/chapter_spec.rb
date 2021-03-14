require "rails_helper"

RSpec.describe Chapter do
  describe "validations" do
    subject { create(:chapter) }

    it { is_expected.to validate_length_of(:name).is_at_least(1).is_at_most(125).allow_blank }
    it { is_expected.to validate_numericality_of(:number).only_integer.is_greater_than_or_equal_to(1).is_less_than_or_equal_to(100_000) }
    it { is_expected.to validate_presence_of(:status) }
  end
end
