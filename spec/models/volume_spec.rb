require "rails_helper"

RSpec.describe Volume do
  describe "validations" do
    subject { create(:volume) }

    it { is_expected.to validate_numericality_of(:number).only_integer.is_greater_than_or_equal_to(1).is_less_than_or_equal_to(1_000) }
    it { is_expected.to validate_uniqueness_of(:number).scoped_to(:book_id) }
  end
end
