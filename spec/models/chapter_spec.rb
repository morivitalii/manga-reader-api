require "rails_helper"

RSpec.describe Chapter do
  describe "validations" do
    subject { create(:chapter) }

    it { is_expected.to validate_numericality_of(:number).only_integer.is_greater_than_or_equal_to(1).is_less_than_or_equal_to(100_000) }
    it { is_expected.to validate_uniqueness_of(:number).scoped_to(:title_id, :group_id) }
    it { is_expected.to validate_presence_of(:publication_status) }
  end
end
