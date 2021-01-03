require "rails_helper"

RSpec.describe Group do
  describe "validations" do
    subject { create(:group) }

    it { is_expected.to validate_presence_of(:title) }
  end
end
