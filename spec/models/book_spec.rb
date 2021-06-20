require "rails_helper"

RSpec.describe Book do
  describe "validations" do
    subject { create(:book) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(1).is_at_most(125) }
    it { is_expected.to validate_length_of(:description).is_at_least(1).is_at_most(5_000).allow_blank }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:publication_status) }
  end
end
